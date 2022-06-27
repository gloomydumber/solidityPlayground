// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// lecture 30 - modifier
// require문으로 요구조건을 걸어뒀는데, 해당 요구조건이 여러 함수에 사용되었을 경우 modifier로 간단히 코딩 가능

// modifier 

contract lec30{
  modifier onlyAdults{
    revert("You are not allowed to pay for the cigarette");
    _;
  } 
  
  function BuyCigarette() public pure onlyAdults returns(string memory){
    return "Your payment is succeeded"; // Unreachable code, 11 line에서 revert될 것이기 때문
  }
  
  modifier onlyAdults2(uint256 _age){ // parameter 값이 있는 modifier
    require(_age > 18, "You are not allowed to pay for the cigarette");
    _;
  }

  function BuyCigarette2(uint256 _age) public pure onlyAdults2(_age) returns(string memory){
    return "Your payment is succeeded";
  }

  uint256 public num = 5;
  modifier numChange{
    num = 10;
    _;
  }

  function numChangeFunction() public numChange{
    num = 15;
  }
}