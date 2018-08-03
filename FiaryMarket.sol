pragma solidity ^0.4.24;

import "./FiaryMarketBase.sol";
import "./Util/SafeMath.sol";
	
contract FiaryMarket is FiaryMarketBase {
	using SafeMath for uint256;

    event StartSale(uint256 indexed fairyId, uint256 price);
    event CancelSale(uint256 indexed fairyId);
    event SuccessSale(uint256 indexed fairyId, uint256 price);
    
	constructor(address candidateNFTAddress) FiaryMarketBase(candidateNFTAddress) public {}
	
	// 요정 판매를 시작합니다.
	function startSale(uint256 fairyId, uint256 price) whenMarketRunning onlyMasterOf(fairyId) public {
		
		// 마켓으로 요정 이전
		nft.transferFrom(msg.sender, this, fairyId);
		
		// 판매 정보 등록
		fairyIdToSale[fairyId] = Sale({
			seller : msg.sender,
			price : price
		});
		
		emit StartSale(fairyId, price);
	}
	
	// 요정 판매를 취소합니다.
	function cancelSale(uint256 fairyId) whenMarketRunning public {
		
		require(msg.sender == fairyIdToSale[fairyId].seller);
		
		// 소유주로 요정 이전
		nft.transferFrom(this, msg.sender, fairyId);
		
		// 판매 정보 삭제
		delete fairyIdToSale[fairyId];
		
		emit CancelSale(fairyId);
	}
	
	// 요정을 구매합니다.
	function buy(uint256 fairyId) whenMarketRunning payable public {
		
		Sale memory sale = fairyIdToSale[fairyId];
		
		// 정상적인 판매인지 체크
		require(checkAddressMisused(sale.seller) != true);
		
		// 지불하고자 하는 가격이 맞는지 체크
		require(msg.value == sale.price);
		
		// 구매자로 요정 이전
		nft.transferFrom(this, msg.sender, fairyId);
		
		// 회사에게 금액의 10%를 지급합니다.
		company.transfer(msg.value.div(10));
		
		// 판매자에게 금액의 90%를 지급합니다.
		sale.seller.transfer(msg.value.div(10).mul(9));
		
		// 판매 정보 삭제
		delete fairyIdToSale[fairyId];
		
		emit SuccessSale(fairyId, sale.price);
	}
}