pragma solidity ^0.4.24;

import "./ERC/ERC165.sol";
import "./ERC/ERC721.sol";

contract FiaryMarketBase {
	
	// 소유권 이전 이벤트
	event TransferOwnership(address oldCompany, address newCompany);
	
	// 마켓을 일시중지하거나 재개하면 발생하는 이벤트
	event PauseMarket();
	event ResumeMarket();
	
	// 판매 정보
	struct Sale {
		
		// 판매자
		address seller;
		
		// 가격
		uint256 price;
	}
	
	// 요정 ID에 해당하는 판매 정보
    mapping(uint256 => Sale) public fairyIdToSale;
	
	// 회사의 지갑 주소
	address public company;
	
	// 대체불가 토큰 계약
	ERC721 public nft;
	
	constructor(address candidateNFTAddress) public {
		// 계약 생성자를 초기 회사로 등록
		company = msg.sender;
		
		ERC165 candidateNFT = ERC165(candidateNFTAddress);
		// ERC721이 구현된 계약인지 확인합니다.
		require(candidateNFT.supportsInterface(bytes4(0x80ac58cd)));
		nft = ERC721(candidateNFT);
	}
	
	// 마켓이 일시중지 상태인지
	bool public marketPaused = false;
	
	// 마켓이 구동중일때만
	modifier whenMarketRunning() {
		require(marketPaused != true);
		_;
	}
	
	// 마켓이 일시정지 상태일때만
	modifier whenMarketPaused() {
		require(marketPaused == true);
		_;
	}
	
	// 회사만 처리 가능
	modifier onlyCompany {
		require(msg.sender == company);
		_;
	}
	
	// 소유권을 이전합니다.
	function transferOwnership(address newCompany) onlyCompany public {
		address oldCompany = company;
		company = newCompany;
		emit TransferOwnership(oldCompany, newCompany);
	}
	
	// 마켓의 작동을 중지합니다.
	function pauseMarket() onlyCompany whenMarketRunning public {
		marketPaused = true;
		emit PauseMarket();
	}
	
	// 마켓을 재개합니다.
	function resumeMarket() onlyCompany whenMarketPaused public {
		marketPaused = false;
		emit ResumeMarket();
	}
	
	// 요정 소유주만
	modifier onlyMasterOf(uint256 fairyId) {
		require(msg.sender == nft.ownerOf(fairyId));
		_;
	}
	
	// 주소를 잘못 사용하는 것인지 체크
	function checkAddressMisused(address target) internal view returns (bool) {
		return
			target == address(0) ||
			target == address(this);
	}
}