pragma solidity ^0.4.24;

import "./EtherFairyBase.sol";
import "./ERC/ERC721.sol";
import "./ERC/ERC721TokenReceiver.sol";
import "./Util/SafeMath.sol";

// 요정 소유권 관련 기능
contract FairyOwnership is EtherFairyBase, ERC721 {
	using SafeMath for uint256;
	
	// 요정의 소유주 정보
	mapping(uint256 => address) public fairyIdToMaster;
	
	// 소유주의 요정 ID 목록 정보
	mapping(address => uint256[]) public masterToFairyIds;
	
	// 요청의 요정 ID 목록에서의 index 정보
	mapping(uint256 => uint256) internal fairyIdToFairyIdsIndex;
	
	// 요정 거래 권한이 승인된 지갑 정보
	mapping(uint256 => address) private fairyIdToApproved;
	
	// 오퍼레이터가 승인되었는지에 대한 정보
	mapping(address => mapping(address => bool)) private masterToOperatorToIsApprovedForAll;
	
	// 요정 소유주만
	modifier onlyMasterOf(uint256 fairyId) {
		require(msg.sender == ownerOf(fairyId));
		_;
	}
	
	// 승인된 지갑만
	modifier onlyApprovedOf(uint256 fairyId) {
		require(
			msg.sender == ownerOf(fairyId) ||
			msg.sender == getApproved(fairyId) ||
			isApprovedForAll(ownerOf(fairyId), msg.sender) == true ||
			msg.sender == officialMarket
		);
		_;
	}
	
	//ERC721: 요정의 개수를 가져옵니다.
	function balanceOf(address master) view public returns (uint256) {
		// 주소 오용 차단
		require(checkAddressMisused(master) != true);
		return masterToFairyIds[master].length;
	}
	
	//ERC721: 요정의 소유주 지갑 주소를 가져옵니다.
	function ownerOf(uint256 fairyId) view public returns (address) {
		address master = fairyIdToMaster[fairyId];
		require(checkAddressMisused(master) != true);
		return master;
	}
	
	// 주어진 주소가 스마트 계약인지 확인합니다.
	function checkIsSmartContract(address addr) view private returns (bool) {
		uint32 size;
		assembly { size := extcodesize(addr) }
		return size > 0;
	}
	
	//ERC721: 요정을 받는 대상이 스마트 계약인 경우, onERC721Received 함수를 실행합니다.
	function safeTransferFrom(address from, address to, uint256 fairyId, bytes data) whenServiceRunning payable external {
		transferFrom(from, to, fairyId);
		if (checkIsSmartContract(to) == true) {
			// ERC721TokenReceiver
			require(ERC721TokenReceiver(to).onERC721Received(msg.sender, from, fairyId, data) == 0x150b7a02);
		}
	}
	
	//ERC721: 요정을 받는 대상이 스마트 계약인 경우, onERC721Received 함수를 실행합니다.
	function safeTransferFrom(address from, address to, uint256 fairyId) whenServiceRunning payable external {
		transferFrom(from, to, fairyId);
		if (checkIsSmartContract(to) == true) {
			// ERC721TokenReceiver
			require(ERC721TokenReceiver(to).onERC721Received(msg.sender, from, fairyId, "") == 0x150b7a02);
		}
	}
	
	//ERC721: 요정을 이전합니다.
	function transferFrom(address from, address to, uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyApprovedOf(fairyId) payable public {
		// 주소 오용 차단
		require(checkAddressMisused(to) != true);
		
		require(from == ownerOf(fairyId));
		require(to != ownerOf(fairyId));
		
		// 거래 권한 제거
		delete fairyIdToApproved[fairyId];
		emit Approval(from, 0, fairyId);
		
		// 기존 소유주로부터 요정 제거
		uint256 index = fairyIdToFairyIdsIndex[fairyId];
		uint256 lastIndex = balanceOf(from).sub(1);
		
		uint256 lastFairyId = masterToFairyIds[from][lastIndex];
		masterToFairyIds[from][index] = lastFairyId;
		
		delete masterToFairyIds[from][lastIndex];
		masterToFairyIds[from].length -= 1;
		
		fairyIdToFairyIdsIndex[lastFairyId] = index;
		
		// 요정 이전
		fairyIdToMaster[fairyId] = to;
		fairyIdToFairyIdsIndex[fairyId] = masterToFairyIds[to].push(fairyId).sub(1);
		
		emit Transfer(from, to, fairyId);
	}
	
	//ERC721: 특정 계약에 거래 권한을 부여합니다.
	function approve(address approved, uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable external {
		
		address master = ownerOf(fairyId);
		
		// 주소 오용 차단
		require(approved != master);
		require(checkAddressMisused(approved) != true);
		
		fairyIdToApproved[fairyId] = approved;
		emit Approval(master, approved, fairyId);
	}
	
	//ERC721: 오퍼레이터에게 거래 권한을 부여하거나 뺏습니다.
	function setApprovalForAll(address operator, bool isApproved) whenServiceRunning whenNotBlocked external {
		// 주소 오용 차단
		require(operator != msg.sender);
		require(checkAddressMisused(operator) != true);
		
		if (isApproved == true) {
			masterToOperatorToIsApprovedForAll[msg.sender][operator] = true;
		} else {
			delete masterToOperatorToIsApprovedForAll[msg.sender][operator];
		}
		
		emit ApprovalForAll(msg.sender, operator, isApproved);
	}
	
	//ERC721: 요정 거래 권한이 승인된 지갑 주소를 가져옵니다.
	function getApproved(uint256 fairyId) public view returns (address) {
		return fairyIdToApproved[fairyId];
	}
	
	//ERC721: 오퍼레이터가 거래 권한을 가지고 있는지 확인합니다.
	function isApprovedForAll(address master, address operator) view public returns (bool) {
		return masterToOperatorToIsApprovedForAll[master][operator] == true;
	}
}