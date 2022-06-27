// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// lecture 29 - return

contract lec29{  
  function add(uint256 _num1, uint256 _num2) public pure returns (uint256){ // return명 존재 하지 않음
    uint256 total = _num1 + _num2;
    return total;
  }
  
  function add2(uint256 _num1, uint256 _num2) public pure returns (uint256 total){ // return명 total로 존재
    total = _num1 + _num2; // 이미 total 이라는 return명이 정의되었기 때문에, uint256 타입 미표기
    return total;
  }
}