pragma solidity ^0.4.24;

import "./FairyOwnership.sol";

// 돈을 지불하고 요정을 업그레이드 하는 기능들
contract FairyPayToUpgrade is FairyOwnership {
	
    event CustomLevelUp(uint256 indexed fairyId);
    event IncreaseHPPointPerLevel(uint256 indexed fairyId);
    event IncreaseAttackPointPerLevel(uint256 indexed fairyId);
    event IncreaseDefencePointPerLevel(uint256 indexed fairyId);
    event IncreaseAgilityPointPerLevel(uint256 indexed fairyId);
    event IncreaseDexterityPointPerLevel(uint256 indexed fairyId);
    event IncreaseFirePointPerLevel(uint256 indexed fairyId);
    event IncreaseWaterPointPerLevel(uint256 indexed fairyId);
    event IncreaseWindPointPerLevel(uint256 indexed fairyId);
    event IncreaseEarthPointPerLevel(uint256 indexed fairyId);
    event IncreaseLightPointPerLevel(uint256 indexed fairyId);
    event IncreaseDarkPointPerLevel(uint256 indexed fairyId);

	// 돈을 지불하고 레벨업 합니다.
	function levelUpFairy(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		// 임의 레벨업 가격과 비교합니다.
		require(msg.value == customLevelUpPrice);
		
		// 요정의 레벨을 올립니다.
		Fairy storage fairy = fairies[fairyId];
		fairy.appendedLevel = fairy.appendedLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit CustomLevelUp(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 HP 증가 포인트를 올립니다.
	function increaseHPPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.hpPointPerLevel);
		
		// 레벨 당 HP 증가 포인트를 올립니다.
		fairy.hpPointPerLevel = fairy.hpPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseHPPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 공격 증가 포인트를 올립니다.
	function increaseAttackPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.attackPointPerLevel);
		
		// 레벨 당 공격 증가 포인트를 올립니다.
		fairy.attackPointPerLevel = fairy.attackPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseAttackPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 방어 증가 포인트를 올립니다.
	function increaseDefencePointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.defencePointPerLevel);
		
		// 레벨 당 방어 증가 포인트를 올립니다.
		fairy.defencePointPerLevel = fairy.defencePointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseDefencePointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 민첩 증가 포인트를 올립니다.
	function increaseAgilityPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.agilityPointPerLevel);
		
		// 레벨 당 민첩 증가 포인트를 올립니다.
		fairy.agilityPointPerLevel = fairy.agilityPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseAgilityPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 재치 증가 포인트를 올립니다.
	function increaseDexterityPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.dexterityPointPerLevel);
		
		// 레벨 당 재치 증가 포인트를 올립니다.
		fairy.dexterityPointPerLevel = fairy.dexterityPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseDexterityPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 불 속성 증가 포인트를 올립니다.
	function increaseFirePointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.firePointPerLevel.add(1));
		
		// 레벨 당 불 속성 증가 포인트를 올립니다.
		fairy.firePointPerLevel = fairy.firePointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseFirePointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 물 속성 증가 포인트를 올립니다.
	function increaseWaterPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.waterPointPerLevel.add(1));
		
		// 레벨 당 물 속성 증가 포인트를 올립니다.
		fairy.waterPointPerLevel = fairy.waterPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseWaterPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 바람 속성 증가 포인트를 올립니다.
	function increaseWindPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.windPointPerLevel.add(1));
		
		// 레벨 당 바람 속성 증가 포인트를 올립니다.
		fairy.windPointPerLevel = fairy.windPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseWindPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 대지 속성 증가 포인트를 올립니다.
	function increaseEarthPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.earthPointPerLevel.add(1));
		
		// 레벨 당 대지 속성 증가 포인트를 올립니다.
		fairy.earthPointPerLevel = fairy.earthPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseEarthPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 빛 속성 증가 포인트를 올립니다.
	function increaseLightPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.lightPointPerLevel.add(1));
		
		// 레벨 당 빛 속성 증가 포인트를 올립니다.
		fairy.lightPointPerLevel = fairy.lightPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseLightPointPerLevel(fairyId);
	}
	
	// 돈을 지불하고 레벨 당 어둠 속성 증가 포인트를 올립니다.
	function increaseDarkPointPerLevel(uint256 fairyId) whenServiceRunning whenNotBlocked whenNotBlockedFairy(fairyId) onlyMasterOf(fairyId) payable public {
		
		Fairy storage fairy = fairies[fairyId];
		
		// 임의로 포인트를 증가시키는데 드는 포인트당 가격과 비교합니다.
		require(msg.value == increasePointPricePerPoint * fairy.darkPointPerLevel.add(1));
		
		// 레벨 당 어둠 속성 증가 포인트를 올립니다.
		fairy.darkPointPerLevel = fairy.darkPointPerLevel.add(1);
		
        uint256 companyRevenue = msg.value.div(2);
        uint256 designerRevenue = msg.value.div(2);
        
        require(companyRevenue.add(designerRevenue) == msg.value);
		
		// 회사에게 금액의 50%를 지급합니다.
		company.transfer(companyRevenue);
		
		// 요정의 디자이너에게 금액의 50%를 지급합니다.
		fairy.designer.transfer(designerRevenue);
		
		emit IncreaseDarkPointPerLevel(fairyId);
	}
}