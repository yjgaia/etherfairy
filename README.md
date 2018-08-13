# Ether Fairy Smart Contracts
Ether Fairy의 스마트 계약 소스 코드입니다.

개발자 분들의 검증과 코드 보완을 위해 Ether Fairy의 스마트 계약을 모두 공개합니다. 의문점이나 버그가 발견되면 [Issues](https://github.com/Hanul/EtherFairySmartContracts/issues)에 남겨주시면 대단히 감사하겠습니다.

각 스마트 계약 코드에 대한 설명은 아래와 같습니다.

## ERC-721 표준 인터페이스
- `ERC165.sol`
- `ERC721.sol`
- `ERC721Metadata.sol`
- `ERC721Enumerable.sol`
- `ERC721TokenReceiver.sol`

대체불가 토큰(Non-Fungible Token) 구현을 위해 ERC 표준으로 지정된 [ERC-721](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md) 인터페이스입니다. 이를 통해 유저간 거래 및 거래소를 통해 요정을 거래할 수 있도록 합니다.

## SafeMath.sol
비단 이더리움 스마트 계약 뿐 아니라 일반적인 프로그램 작성시에도 숫자 계산에 있어 표현 범위를 넘어가 Overflow가 발생하면 의도하지 않는 값이 들어가가게 되는 버그 발생의 여지가 있습니다. 이를 방지하기 위해 모든 숫자 계산에서 Overflow를 방지하기 위한 라이브러리입니다. `uint256` 타입의 4칙연산을 지원합니다.

## StringUtil.sol
문자열 처리 관련 유틸리티 기능이 저장되어있는 계약입니다.

## EtherFairyBase.sol
요정 정보를 이루는 구조체 등 Ether Fairy의 기본적인 내용이 들어있는 계약입니다.

## EtherFairyCompany.sol
회사가 사용하는 기능들이 포함된 계약입니다. 처음 계약 생성자가 회사로 등록되며, 회사는 스마트 계약의 소유권을 다른 사람에게 양도할 수 있습니다. 회사는 또한 만일의 경우 스마트 계약의 작동을 중단하거나, 다시 동작시킬 수 있습니다.

## FairyOwnership.sol
ERC-721을 상속하여 구현한, 요정 소유권에 관한 기능들이 포함된 계약입니다.

## FairyPayToUpgrade.sol
이더를 지불하고 요정을 임의로 업그레이드하는 기능들이 포함된 계약입니다.

## FairyMaster.sol
요정 소유주의 모든 기능이 포함된 계약입니다. `FairyOwnership.sol`과 `FairyPayToUpgrade.sol`를 상속하고 추가로 요정을 탄생시키는 기능이 포함되어 있습니다.

## FairyInfo.sol
요정의 정보를 제공하는 기능들이 포함된 계약입니다.

## EtherFairy.sol
위 계약들을 모두 엮고 Ether Fairy 서비스를 위해 여러가지 기능을 추가한 통합 스마트 계약입니다.

### 기능 목록
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `name()` 토큰의 이름 반환
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `symbol()` 토큰의 심볼 반환
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `tokenURI(uint256 fairyId)` 요정 정보의 메타데이터를 가져오는 경로를 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `transferOwnership(address newCompany)` 소유권을 이전합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `pauseService()` 서비스의 작동을 중지합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `resumeService()` 서비스를 재개합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `changeFairyOriginPrice(uint256 newFairyOriginPrice)` 요정 원본의 가격을 변경합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `changeCustomLevelUpPrice(uint256 newCustomLevelUpPrice)` 임의 레벨업 가격을 변경합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `changeIncreasePointPricePerPoint(uint256 newIncreasePointPricePerPoint)` 임의로 포인트를 증가시키는데 드는 포인트당 가격을 변경합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `changeTokenMetadataBaseURI(string newTokenMetadataBaseURI)` tokenMetadataBaseURI을 변경합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `changeOfficialMarket(address newOfficialMarket)` 공식 마켓 계약을 변경합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `blockMaster(address masterToBlock)` 특정 소유주를 차단합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `blockFairy(uint256 fairyIdToBlock)` 특정 요정을 차단합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `unblockMaster(address masterToBlock)` 소유주 차단을 해제합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `unblockFairy(uint256 fairyIdToBlock)` 요정 차단을 해제합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `balanceOf(address master)` 요정의 개수를 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `ownerOf(uint256 fairyId)` 요정의 소유주 지갑 주소를 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `safeTransferFrom(address from, address to, uint256 fairyId, bytes data)` 요정을 받는 대상이 스마트 계약인 경우, onERC721Received 함수를 실행합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `safeTransferFrom(address from, address to, uint256 fairyId)` 요정을 받는 대상이 스마트 계약인 경우, onERC721Received 함수를 실행합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `transferFrom(address from, address to, uint256 fairyId)` 요정을 이전합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `approve(address approved, uint256 fairyId)` 특정 지갑에 거래 권한을 부여합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `setApprovalForAll(address operator, bool isApproved)` 오퍼레이터에게 거래 권한을 부여하거나 뺏습니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getApproved(uint256 fairyId)` 요정 거래 권한이 승인된 지갑 주소를 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `isApprovedForAll(address master, address operator)` 오퍼레이터가 거래 권한을 가지고 있는지 확인합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `levelUpFairy(uint256 fairyId)` 돈을 지불하고 레벨업 합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseHPPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 HP 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseAttackPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 공격 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseDefensePointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 방어 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseAgilityPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 민첩 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseDexterityPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 재치 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseFirePointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 불 속성 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseWaterPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 물 속성 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseWindPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 바람 속성 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseEarthPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 대지 속성 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseLightPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 빛 속성 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `increaseDarkPointPerLevel(uint256 fairyId)` 돈을 지불하고 레벨 당 어둠 속성 증가 포인트를 올립니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `birthFairy(string fairyOriginId, address designer, string name, uint256 firePointPerLevel, uint256 waterPointPerLevel, uint256 windPointPerLevel, uint256 earthPointPerLevel, uint256 lightPointPerLevel, uint256 darkPointPerLevel)` 요정을 탄생시킵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `changeFairyName(uint256 fairyId, string newName)` 요정의 이름을 변경합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `getMasterIdsByFairyCount()` 요정을 많이 가진 순서대로 소유주의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyCount()` 요정의 개수를 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `getFairyCountByOriginId(string fairyOriginId)` 원본 ID에 해당하는 요정의 개수를 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) `getFairyIdsByOriginId(string fairyOriginId)` 원본 ID에 해당하는 요정의 ID 목록을 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getMasterCount()` 소유주 계정의 개수를 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyBasicInfo(uint256 fairyId)` 요정의 기본 정보를 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyBasicPointsPerLevel(uint256 fairyId)` 요정의 기본 속성에 대한 레벨 당 증가 포인트들을 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyElementPointsPerLevel(uint256 fairyId)` 요정의 원소 속성에 대한 레벨 당 증가 포인트들을 반환합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByBirthTime()` 최근에 태어난 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByAppendedLevel()` 소유주에 의해 추가된 레벨이 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByHPPointPerLevel()` 레벨 당 HP 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByAttackPointPerLevel()` 레벨 당 공격 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByDefensePointPerLevel()` 레벨 당 방어 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByAgilityPointPerLevel()` 레벨 당 민첩 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByDexterityPointPerLevel()` 레벨 당 재치 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByFirePointPerLevel()` 레벨 당 불 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByWaterPointPerLevel()` 레벨 당 물 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByWindPointPerLevel()` 레벨 당 바람 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByEarthPointPerLevel()` 레벨 당 대지 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByLightPointPerLevel()` 레벨 당 빛 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `getFairyIdsByDarkPointPerLevel()` 레벨 당 어둠 속성 증가 포인트가 높은 순서대로 요정의 ID 목록을 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `supportsInterface(bytes4 interfaceID)` 주어진 인터페이스가 구현되어 있는지 확인합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) 각종 이벤트들

## FiaryMarketBase.sol
요정 거래 마켓의 기본적인 내용이 들어있는 계약입니다.

## FiaryMarket.sol
요정 거래 마켓 계약입니다. 요정을 마켓에 올리거나 구매할 수 있습니다.

### 기능 목록
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `transferOwnership(address newCompany)` 소유권을 이전합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `pauseMarket()` 마켓의 작동을 중지합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `resumeMarket()` 마켓을 재개합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `startSale(uint256 fairyId, uint256 price)` 요정 판매를 시작합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `checkFairyForSale(uint256 fairyId)` 요정이 판매되고 있는지 확인합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `findSaleIdByFairyId(uint256 fairyId)` 요정 ID로부터 판매 정보 ID를 가져옵니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `cancelSale(uint256 fairyId)` 요정 판매를 취소합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-yes-brightgreen.svg) `buy(uint256 fairyId)` 요정을 구매합니다.
- ![테스트 여부](https://img.shields.io/badge/테스트%20여부-no-red.svg) 각종 이벤트들

## 라이센스
[MIT](LICENSE)

## 작성자
[Young Jae Sim](https://github.com/Hanul)
 