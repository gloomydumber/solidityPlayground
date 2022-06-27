// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

// lecture 36 - call

/*
call : 로우레벨 함수 
1. 송금하기
2. 외부 스마트 컨트랙 함수 부르기 
3. 가변적인 gas
4. 이스탄불 하드포크, 2019년 12월이후, gas 가격 상승에 따른,  call 사용 권장/ send tranfer = 2300gas 
5. re-entrancy(재진입) 공격위험 있기에, Checks_Effects_Interactions_pattern 사용  
*/

contract add{
  event JustFallback(string _str);
  event JustReceive(string _str);
  function addNumber(uint256 _num1, uint256 _num2) public pure returns(uint256){
      return _num1 + _num2;
  }
  fallback() external payable  { // add 스마트 컨트랙트에 없는 함수를 호출하면, fallback 발동
  // 1. 어떤 함수 실행을 요청받을 때 2. 어떤 함수 실행을 요청 받으면서, 동시에 ETH를 수신할 때
    emit JustFallback("JustFallback is called");
  }
  receive() external payable { // 순수하게 ETH를 수신할 때
    emit JustReceive("JustReceive is called");
  }
}

contract caller{
  event calledFunction(bool _success, bytes _output);
  //1. 송금하기 
  function transferEther(address payable _to) public payable{
      (bool success,) = _to.call{value:msg.value}(""); // 0.7 버전 이후의 call 형식임, bool success, 이후에 변수가 없는 이유는 리턴값인 바이트 메모리를 출력할 필요가 없어서 생략
      require(success,"failed to transfer ether");
  }
  //2. 외부 스마트 컨트랙 함수 부르기 
  function callMethod(address _contractAddr, uint256 _num1, uint256 _num2) public{
    (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call(abi.encodeWithSignature("addNumber(uint256,uint256)", _num1, _num2));
    require(success,"failed to transfer ether");
    emit calledFunction(success,outputFromCalledFunction);
  }
  
  function callMethod3(address _contractAddr) public payable{
    (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call{value:msg.value}(abi.encodeWithSignature("Nothing()"));
    require(success,"failed to transfer ether");
    emit calledFunction(success,outputFromCalledFunction);
  }
}