// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 15 - super

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

contract Son is Father{
  event sonName(string name);
  function who() public override{
    // 부모의 who() 함수가 엄청 길다면, 자식에서도 같은 내용의 코드를 매우 길게 작성해야할 수 있다.
    // 이를 용이하게 해결하기 위해, super 키워드를 사용
    super.who(); // same as line 8, Father contract's who function
    // 이곳 예제에서는, line9, emit FatherName("Kimdaeho"); 만 동작
    emit sonName("KimJin");
  }
}