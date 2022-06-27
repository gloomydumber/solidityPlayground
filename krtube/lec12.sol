// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 12 - plural inheritance

contract Father{
  uint256 public fatherMoney = 100;
  function getFatherName() public pure returns(string memory){
      return "KimJung";
  }
  
  function getMoney() public view virtual returns(uint256){
      return fatherMoney;
  }
}

contract Mother{
  uint256 public motherMoney = 500;
  function getMotherName() public  pure returns(string memory){
      return "Leesol";
  }
  function getMoney() public view virtual returns(uint256){
      return motherMoney;
  }
}


contract Son is Father, Mother {
  // Father, Mother 둘 다 getMoney() 함수가 선언되어있으므로, 둘 다 상속 하려면 overriding 필요
  function getMoney() public view override(Father,Mother) returns(uint256){
      return fatherMoney + motherMoney;
  }
}