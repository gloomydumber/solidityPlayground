// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// lecture 14 - indexed (event 내의 keyword)
// indexed를 통해서 원하는 index의 event에 저장된 값들을 가져올 수 있음
// Remix 상에서는 확인 불가능한 예제라, ganache / truffle / web3.js / metmask 등을 활용하여 확인한 예제임

contract lec14  {
  event numberTracker(uint256 num, string str);
  event numberTracker2(uint256 indexed num, string str); // numberTracker2는 indexed 키워드가 있음

  uint256 num = 0;
  function PushEvent(string memory _str) public {
      emit numberTracker(num, _str);
      emit numberTracker2(num, _str);
      num ++;
  }
}