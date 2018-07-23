pragma solidity ^0.4.24;

import "./FairyOwnership.sol";
import "./FairyPayToUpgrade.sol";
import "./Util/SafeMath.sol";

// 요정 소유주가 사용하는 기능들
contract FairyMaster is FairyOwnership, FairyPayToUpgrade {
	using SafeMath for uint256;
	
	// 요정 탄생 이벤트
    event FairyBirth(address indexed master, uint256 fairyId);
	
	// 요정을 탄생시킵니다.
	function birthFairy(
		
		// 회사 서버에 저장된 요정 원본 ID
		string fairyOriginId,
		
		// 요정 디자이너의 지갑 주소
		address designer,
		
		// 요정의 이름
		string name,
		
		// 원소 속성에 대한 레벨 당 증가 포인트들
		uint256 firePointPerLevel,
		uint256 waterPointPerLevel,
		uint256 windPointPerLevel,
		uint256 earthPointPerLevel,
		uint256 lightPointPerLevel,
		uint256 darkPointPerLevel
		) whenServiceRunning whenNotBlocked payable public {
		
		// 요정 원본의 가격과 비교합니다.
		require(msg.value == fairyOriginPrice);
		
		// 초기0 속성 값들의 총합은 5가 되어야 합니다.
		uint256 totalPointPerLevel = firePointPerLevel;
		totalPointPerLevel = totalPointPerLevel.add(waterPointPerLevel);
		totalPointPerLevel = totalPointPerLevel.add(windPointPerLevel);
		totalPointPerLevel = totalPointPerLevel.add(earthPointPerLevel);
		totalPointPerLevel = totalPointPerLevel.add(lightPointPerLevel);
		totalPointPerLevel = totalPointPerLevel.add(darkPointPerLevel);
		require(totalPointPerLevel == 5);
		
		// 요정 데이터 생성
		uint256 fairyId = fairies.push(Fairy({
			
			fairyOriginId : fairyOriginId,
			designer : designer,
			name : name,
			birthTime : now,
			appendedLevel : 0,
			
			// EVM의 특성 상 너무 많은 변수를 한번에 할당 할 수 없으므로,
			// 기본 속성은 1로 통일하여 지정합니다.
			hpPointPerLevel : 1,
			attackPointPerLevel : 1,
			defensePointPerLevel : 1,
			agilityPointPerLevel : 1,
			dexterityPointPerLevel : 1,
			
			firePointPerLevel : firePointPerLevel,
			waterPointPerLevel : waterPointPerLevel,
			windPointPerLevel : windPointPerLevel,
			earthPointPerLevel : earthPointPerLevel,
			lightPointPerLevel : lightPointPerLevel,
			darkPointPerLevel : darkPointPerLevel
		})).sub(1);
		
		// msg.sender를 소유주로 등록
		fairyIdToMaster[fairyId] = msg.sender;
		fairyIdToFairyIdsIndex[fairyId] = masterToFairyIds[msg.sender].push(fairyId).sub(1);
		
		// 소유주 주소 등록
		if (masterToIsExisted[msg.sender] != true) {
			masters.push(msg.sender);
			masterToIsExisted[msg.sender] = true;
		}
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(msg.value.div(2));
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		designer.transfer(msg.value.div(2));
		
		// 이벤트 발생
		emit FairyBirth(msg.sender, fairyId);
		emit Transfer(0x0, msg.sender, fairyId);
	}

	// 요정의 이름을 변경합니다.
	function changeFairyName(uint256 fairyId, string newName) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) public {
		fairies[fairyId].name = newName;
	}
}