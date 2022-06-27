// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 9 - constructor (생성자)
// 생성자는 변수의 값을 초기화 할 때 주로 씀

contract A{
    string public name;
    uint256 public age;
    
    constructor(string memory _name, uint256 _age){
        name = _name;
        age = _age;
    }
        
    function change(string memory _name, uint256 _age) public  {
      name = _name;
      age = _age;
    }
}

contract B{
  A instance = new A("Alice", 52); // Contract A에 생성자가 있으므로, 초기값을 인자로 하여금 설정 가능
  
  function change(string memory _name, uint256 _age) public  {
        instance.change(_name,_age);
    }
  
  function get() public view returns(string memory, uint256) {
        return (instance.name(), instance.age());
    }
}