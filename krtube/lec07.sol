// SPDX-License-Identifier: GPL-3.0

// lecture 7 - 4가지 저장영역과 string

pragma solidity >=0.7.0 < 0.9.0;
/*
storage : 대부분의 변수, 함수들이 저장되며, 영속적으로 저장이되어 가스 비용이 비싸요 (함수 밖의 전역 변수들, 함수 그 자체가 storage에 저장)
memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장이 됩니다.
그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기에 storage보다 가스 비용이 싸답니다.
Colldata : 주로 external function 의 파라메터에서 사용 됩니다.
stack:  EVM (Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역인데 1024Mb 제한적입니다.이 컨트랙을 상속받은 자식 컨트랙도 접근가능)
*/

// string은 기본 데이터 타입이 아니라, reference type 이므로, memory 키워드를 이용해 선언
// uint256 으로 함수의 인자나 반환값을 선언할 때는, 기본 데이터 아입이므로, memory 키워드를 지정하지 않아도 자동으로 memory로 default 처리됨

contract lec7 {
    
    function get_string(string memory _str) public pure returns(string memory){
        return _str;
    }
}