// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecutre 18 - array
// array는 length를 구할 수 있고, 순회도 지원
// 다만, Solidity에서는 array보다는 mapping을 선호
// 순회는 DDOS 공격 등으로 이더리움 네트워크에 혼잡을 주는데 악용 가능

contract lec18{
  uint256[] public ageArray;
  uint256[10] public ageFixedSizeArray; // 고정된 index의 배열 선언 가능
  string[] public nameArray= ["Kal", "Jhon", "Kerri"]; // 값 미리 정의 가능

  function AgeLength() public view returns(uint256) {
    return ageArray.length;
  }
  
  function AgePush(uint256 _age) public{
    ageArray.push(_age);
  }
  function AgeChange(uint256 _index, uint256 _age) public{
    // array에 없는 index에 값을 변경하려고 하면 에러 throw
    ageArray[_index] = _age;
  }
  function AgeGet(uint256 _index) public view returns(uint256){
    return ageArray[_index];
  }
  function AgePop() public {
    ageArray.pop();
  }
  
  function AgeDelete(uint256 _index) public {
    // delete의 경우에는, 해당 index의 값이 0으로 변경될 뿐, 완전 삭제되어 array의 length가 줄어드는 것은 아니다
    // 따라서, delete 후에 line21, AgeChange와 같이 해당 index에 다른 값을 넣는 식으로 채워줄 수도 있다
    delete ageArray[_index];
  }
}