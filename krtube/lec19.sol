// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 20 - mapping & array 주의점
// mapping과 array는 reference로 저장하는 것이 아니라, 해당 시점의 값을 캡쳐해서 그 값만 저장한다

contract lec19{
  uint256 num = 89; // 이 변수가 변하더라도 저장 시점의 mapping과 array의 값은 변하지 않는다. 즉, mapping과 array에 새로 저장해줘야한다
  mapping(uint256 => uint256) numMap;
  uint256[] numArray;

  function changeNum(uint256 _num) public{
    num = _num;
  }
  function showNum() public view returns(uint256){
    return num;
  }

  function numMapAdd() public{
    numMap[0] = num;
  }
  function showNumMap() public view returns(uint256){
    return numMap[0];
  }
  function UpdateMap() public{
    numMap[0] = num;
  }

  function numArrayAdd() public{
    numArray.push(num);
  }
  function showNumArray() public view returns(uint256){
    return numArray[0];
  }
  function updateArray() public {
    numArray[0] = num;
  }
}