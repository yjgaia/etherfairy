pragma solidity ^0.4.24;

import "./EtherFairyBase.sol";

// 요정 정보를 제공하는 계약
contract FairyInfo is EtherFairyBase {
	
	// 요정의 기본 정보를 반환합니다.
	function getFairyBasicInfo(uint256 fairyId) view public returns (
		string fairyOriginId,
		string name,
		uint256 birthTime,
		uint256 appendedLevel) {
		
		Fairy memory fairy = fairies[fairyId];
		
		return (
			fairy.fairyOriginId,
			fairy.name,
			fairy.birthTime,
			fairy.appendedLevel
		);
	}
	
	// 요정의 기본 속성에 대한 레벨 당 증가 포인트들을 반환합니다.
	function getFairyBasicPointsPerLevel(uint256 fairyId) view public returns (
		uint256 hpPointPerLevel,
		uint256 attackPointPerLevel,
		uint256 defensePointPerLevel,
		uint256 agilityPointPerLevel,
		uint256 dexterityPointPerLevel) {
		
		Fairy memory fairy = fairies[fairyId];
		
		return (
			fairy.hpPointPerLevel,
			fairy.attackPointPerLevel,
			fairy.defensePointPerLevel,
			fairy.agilityPointPerLevel,
			fairy.dexterityPointPerLevel
		);
	}
	
	// 요정의 원소 속성에 대한 레벨 당 증가 포인트들을 반환합니다.
	function getFairyElementPointsPerLevel(uint256 fairyId) view public returns (
		uint256 firePointPerLevel,
		uint256 waterPointPerLevel,
		uint256 windPointPerLevel,
		uint256 earthPointPerLevel,
		uint256 lightPointPerLevel,
		uint256 darkPointPerLevel) {
		
		Fairy memory fairy = fairies[fairyId];
		
		return (
			fairy.firePointPerLevel,
			fairy.waterPointPerLevel,
			fairy.windPointPerLevel,
			fairy.earthPointPerLevel,
			fairy.lightPointPerLevel,
			fairy.darkPointPerLevel
		);
	}
}