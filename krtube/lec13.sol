// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// lecture 13 - event
// event로 값을 출력 할 때에는, 그 값이 블록안에 저장이 됨

contract lec13 {   
  event info(string name, uint256 money);
  // event키워드 event이름(event로 출력하고자 하는 값 인수{들})
  
  function sendMoney() public {
      emit info("KimDaeJin", 1000); // emit 키워드로 event 출력 (출력과 동시에 블록에 이 값들이 저장됨)
  }
}