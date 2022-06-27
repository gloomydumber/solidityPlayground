// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 11 - overriding
// virtual & override 키워드로 overriding 구현함

contract Father{
  string public familyName = "Kim";
  string public givenName = "Jung";
  uint256 public money = 100; 
  
  constructor(string memory _givenName){
    givenName = _givenName;
  }
  
  
  function getFamilyName() view public returns(string memory){
    return familyName;
  } 
  
  function getGivenName() view public returns(string memory){
    return givenName;
  } 
  
  function getMoney() view public virtual returns(uint256){
    // overriding 대상은 virtual 키워드로 표기
    return money;
  }
}

contract Son is Father("James"){
  /*
  아래와 같은 방식도 동일한 동작
  contract Son is Father{
  constructor() Father("James"){

  }
  ...
  }
  */
  uint256 public earning = 0;
  function work() public {
    earning += 100;
  }

  function getMoney() view public override returns(uint256){
    // overriding 하는 함수는 override 키워드로 표기
    return money + earning;
  }
}