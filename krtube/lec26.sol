// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// lecture 26 - error handler (assert, revert, require)
// 0.8.x ~ version
// 에러핸들러: require, revert, assert, try/catch

contract lec26{
    
/*
  0.8.0 포함X
  0.8.1~ : ⭐ assert의 경우에도 가스가 환불됨 ⭐
  assert: 오직 내부적 에러 테스트 용도, 불변성 체크 용도.
  assert가 에러를 발생시키면, Panic(uint256) 이라는 에러타입의 에러 발생
*/

//3000000 gas 
  function assertNow() public pure{
    assert(false); // test용, 스마트 컨트랙트를 완전히 만들고 나서 truffle 내에서 잘 돌아가는지 확인하는 용도 등
  }  
//21322 gas
  function revertNow() public pure{
    revert("error!!"); // if or require = if + revert;
  }
//21338 gas
  function requireNow()public pure{
    require(false, "occurred");
  }
  
  function onlyAdults(uint256 _age) public pure returns(string memory){
    if( _age < 19){
      revert("You are not allowed to pay for the cigarette");
    }
    return "Your payment is scceeded";
  } 
  
  function onlyAdults2(uint256 _age) public pure returns(string memory){
    require(_age > 19,"You are not allowed to pay for the cigarette");
    return "Your payment is scceeded";
  }
}