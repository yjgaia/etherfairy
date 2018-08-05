pragma solidity ^0.4.24;

import "./ERC/ERC721Metadata.sol";
import "./Util/StringUtil.sol";

// Ether Fairy의 기본적인 내용을 담고있는 계약
contract EtherFairyBase is ERC721Metadata {
	
	// 토큰 정보
	string constant public NAME = "Ether Fairy";
	string constant public SYMBOL = "FAIRY";
	string public tokenMetadataBaseURI = "https://etherfairy.com/api/tokenmetadata/";
	
	// 요정 원본의 가격 (초기 가격은 0.01 이더입니다.)
	uint256 public fairyOriginPrice = 0.01 ether;
	
	// 임의 레벨업 가격
	uint256 public customLevelUpPrice = 0.01 ether;
	
	// 임의로 포인트를 증가시키는데 드는 포인트당 가격
	uint256 public increasePointPricePerPoint = 0.01 ether;
	
	// 요정 정보
	struct Fairy {
		
		// 회사 서버에 저장된 요정 원본의 ID
		string fairyOriginId;
		
		// 요정 디자이너의 지갑
		address designer;
		
		// 요정의 이름
		string name;
		
		// 탄생 시간
		uint256 birthTime;
		
		// 소유주에 의해 추가된 레벨
		uint256 appendedLevel;
		
		// 기본 속성에 대한 레벨 당 증가 포인트들
		uint256 hpPointPerLevel;
		uint256 attackPointPerLevel;
		uint256 defensePointPerLevel;
		uint256 agilityPointPerLevel;
		uint256 dexterityPointPerLevel;
		
		// 원소 속성에 대한 레벨 당 증가 포인트들
		uint256 firePointPerLevel;
		uint256 waterPointPerLevel;
		uint256 windPointPerLevel;
		uint256 earthPointPerLevel;
		uint256 lightPointPerLevel;
		uint256 darkPointPerLevel;
	}
	
	// 요정들의 저장소
	Fairy[] internal fairies;
	
	function getFairyCount() view public returns (uint256) {
		return fairies.length;
	}
	
	// 소유주들 주소
	address[] public masters;
	
	function getMasterCount() view public returns (uint256) {
		return masters.length;
	}
	
	// 소유주가 이미 존재하는지
	mapping(address => bool) internal masterToIsExisted;
	
	// 소유주가 차단되었는지
	mapping(address => bool) public masterToIsBlocked;
	
	// 요정이 차단되었는지
	mapping(uint256 => bool) public fairyIdToIsBlocked;
	
	// 회사의 지갑 주소
	address public company;
	
	constructor() public {
		// 계약 생성자를 초기 회사로 등록
		company = msg.sender;
	}
	
	// 서비스가 일시중지 상태인지
	bool public servicePaused = false;
	
	// 서비스가 구동중일때만
	modifier whenServiceRunning() {
		require(servicePaused != true);
		_;
	}
	
	// 서비스가 일시정지 상태일때만
	modifier whenServicePaused() {
		require(servicePaused == true);
		_;
	}
	
	// 차단된 소유주가 아닐 경우에만
	modifier whenNotBlocked() {
		// 회사는 차단 불가
		require(msg.sender == company || masterToIsBlocked[msg.sender] != true);
		_;
	}
	
	// 차단된 요정이 아닐 경우에만
	modifier whenNotBlockedFairy(uint256 fairyId) {
		// 회사는 차단 불가
		require(msg.sender == company || fairyIdToIsBlocked[fairyId] != true);
		_;
	}
	
	// 주소를 잘못 사용하는 것인지 체크
	function checkAddressMisused(address target) internal view returns (bool) {
		return
			target == address(0) ||
			target == address(this);
	}
	
	//ERC721Metadata: 토큰의 이름 반환
	function name() view external returns (string) {
		return NAME;
	}
	
	//ERC721Metadata: 토큰의 심볼 반환
	function symbol() view external returns (string) {
		return SYMBOL;
	}
	
	//ERC721Metadata: 요정 정보의 메타데이터를 가져오는 경로를 반환합니다.
	function tokenURI(uint256 fairyId) view external returns (string) {
		return StringUtil.concat(tokenMetadataBaseURI, StringUtil.uint256ToString(fairyId));
	}
}