pragma solidity ^0.4.24;

import "./EtherFairyBase.sol";

// 요정의 랭킹을 제공하는 계약
contract FairyRank is EtherFairyBase {
	
	// 최근에 태어난 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByBirthTime() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 birthTime = fairies[i].birthTime;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].birthTime < birthTime) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 소유주에 의해 추가된 레벨이 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByAppendedLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 appendedLevel = fairies[i].appendedLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].appendedLevel < appendedLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 HP 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByHPPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 hpPointPerLevel = fairies[i].hpPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].hpPointPerLevel < hpPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 공격 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByAttackPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 attackPointPerLevel = fairies[i].attackPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].attackPointPerLevel < attackPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 방어 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByDefensePointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 defensePointPerLevel = fairies[i].defensePointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].defensePointPerLevel < defensePointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 민첩 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByAgilityPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 agilityPointPerLevel = fairies[i].agilityPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].agilityPointPerLevel < agilityPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 재치 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByDexterityPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 dexterityPointPerLevel = fairies[i].dexterityPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].dexterityPointPerLevel < dexterityPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 불 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByFirePointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 firePointPerLevel = fairies[i].firePointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].firePointPerLevel < firePointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 물 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByWaterPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 waterPointPerLevel = fairies[i].waterPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].waterPointPerLevel < waterPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 바람 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByWindPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 windPointPerLevel = fairies[i].windPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].windPointPerLevel < windPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 대지 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByEarthPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 earthPointPerLevel = fairies[i].earthPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].earthPointPerLevel < earthPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 빛 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByLightPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 lightPointPerLevel = fairies[i].lightPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].lightPointPerLevel < lightPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
	
	// 레벨 당 어둠 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
	function getFairyIdsByDarkPointPerLevel() view public returns (uint256[]) {
		uint256[] memory fairyIds = new uint256[](fairies.length);
		
		for (uint256 i = 0; i < fairies.length; i += 1) {
			
			uint256 darkPointPerLevel = fairies[i].darkPointPerLevel;
			
			for (uint256 j = i; j > 0; j -= 1) {
				if (fairies[fairyIds[j - 1]].darkPointPerLevel < darkPointPerLevel) {
					fairyIds[j] = fairyIds[j - 1];
				} else {
					break;
				}
			}
			
			fairyIds[j] = i;
		}
		
		return fairyIds;
	}
}