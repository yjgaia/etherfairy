pragma solidity ^0.4.24;

// 문자열 처리 유틸리티
library StringUtil {
	
	// 두 문자열을 합칩니다.
	function concat(string a, string b) internal pure returns (string c) {
		
		bytes memory ba = bytes(a);
		bytes memory bb = bytes(b);
		bytes memory bc = bytes(new string(ba.length + bb.length));
		
		uint256 i = 0;
		uint256 j = 0;
		
		for (j = 0; j < ba.length; j += 1) {
			bc[i] = ba[j];
			i += 1;
		}
		
		for (j = 0; j < bb.length; j += 1) {
			bc[i] = bb[j];
			i += 1;
		}
		
		return string(bc);
    }
	
	// uint256를 문자열로 변경합니다.
	function uint256ToString(uint256 i) internal pure returns (string str) {
        if (i == 0) {
        	return "0";
        }
        
        uint256 j = i;
        uint256 length;
        while (j != 0){
            length += 1;
            j /= 10;
        }
        
        bytes memory bstr = new bytes(length);
        uint256 k = length - 1;
        while (i != 0){
            bstr[k -= 1] = byte(48 + i % 10);
            i /= 10;
        }
        
        return string(bstr);
    }
}