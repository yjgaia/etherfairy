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
		
		// 판매 정보 생성
		sales.push(Sale({
			seller : msg.sender,
			fairyId : fairyId,
			price : price
		}));
		
		emit StartSale(fairyId, price);
	}
	
	// 요정이 판매되고 있는지 확인합니다.
	function checkFairyForSale(uint256 fairyId) whenMarketRunning public view returns (bool) {
		
		// saleId를 찾습니다.
		for (uint256 i = 0; i < sales.length; i += 1) {
			if (sales[i].fairyId == fairyId) {
				return true;
			}
        }
		
		return false;
	}
	
	// 요정 ID로부터 판매 정보 ID를 가져옵니다.
	function findSaleIdByFairyId(uint256 fairyId) whenMarketRunning public view returns (uint256) {
		
		bool isFound = false;
		uint256 saleId;
		
		// saleId를 찾습니다.
		for (uint256 i = 0; i < sales.length; i += 1) {
			if (sales[i].fairyId == fairyId) {
				saleId = i;
				isFound = true;
			}
        }
		
		// 판매 정보를 찾은 경우에만
		require(isFound == true);
		
		return saleId;
	}
	
	// 요정 판매를 취소합니다.
	function cancelSale(uint256 fairyId) whenMarketRunning public {
		
		bool isFound = false;
		uint256 saleId;
		
		// saleId를 찾습니다.
		for (uint256 i = 0; i < sales.length; i += 1) {
			if (sales[i].fairyId == fairyId) {
				saleId = i;
				isFound = true;
			}
        }
		
		// 소유주인 경우에만
		require(isFound == true && msg.sender == sales[saleId].seller);
		
		// 소유주로 요정 이전
		nft.transferFrom(this, msg.sender, fairyId);
		
		// 판매 정보 삭제
		for (i = saleId; i < sales.length - 1; i += 1){
            sales[i] = sales[i + 1];
        }
        delete sales[sales.length - 1];
        sales.length -= 1;
		
		emit CancelSale(fairyId);
	}
	
	// 요정을 구매합니다.
	function buy(uint256 fairyId) whenMarketRunning payable public {
		
		bool isFound = false;
		uint256 saleId;
		Sale memory sale;
		
		// saleId를 찾습니다.
		for (uint256 i = 0; i < sales.length; i += 1) {
			if (sales[i].fairyId == fairyId) {
				saleId = i;
				sale = sales[i];
				isFound = true;
			}
        }
		
		// 판매 정보를 찾은 경우에만
		require(isFound == true);
		
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
		for (i = saleId; i < sales.length - 1; i += 1){
            sales[i] = sales[i + 1];
        }
        delete sales[sales.length - 1];
        sales.length -= 1;
		
		emit SuccessSale(fairyId, sale.price);
	}
}