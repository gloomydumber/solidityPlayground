// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 16 - Order of Inheritance (상속의 순서)

contract Father {
  event FatherName(string name);
  function who() public virtual{
    emit FatherName("KimDaeho");
  }
}

contract Mother {
  event MotherName(string name);
  function who() public virtual{
    emit MotherName("leeSol");
  }
}

contract Son is Father, Mother{ // 최우측 상속하는 contract가 우선 상속
  function who() public override(Father, Mother){
      super.who(); // super가 어떤 부모를 나타낼까?
      // 최우측에서 상속하는 Mother가 super에 해당함
  }
}