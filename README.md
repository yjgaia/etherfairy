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

## FiaryMarketBase.sol
요정 거래 마켓의 기본적인 내용이 들어있는 계약입니다.

## FiaryMarket.sol
요정 거래 마켓 계약입니다. 요정을 마켓에 올리거나 구매할 수 있습니다.

## 라이센스
[MIT](LICENSE)

## 작성자
[Young Jae Sim](https://github.com/Hanul)
