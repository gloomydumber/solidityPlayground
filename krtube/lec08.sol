// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// lecture 8 - instance

// instance는 하나의 컨트랙트에서, 다른 컨트랙트에 접근 할 때 사용
// instance는 가스 소모량이 많을 수 있으니, 잘 고려해서 사용하도록 한다

contract A{
    
    uint256 public a = 5;
    
    function change(uint256 _value) public {
        a = _value;
    } 
}

contract B{
    
    A instance = new A(); // 컨트랙트이름 인스턴스변수명 = new 컨트랙트이름();
    // 인스턴스는 말그대로 A 컨트랙트의 또 다른 인스턴스를 의미하므로,
    // A 컨트랙트 그 자체의 변수를 바꾸는게 아니라, 인스턴스의 변수를 바꾸는 것이므로 주의해야한다
    // 즉, 컨트랙트 A와, 인스턴스로 만들어진 컨트랙트 A는 구조는 같지만 별개의 것이다
    
    function get_A() public view returns(uint256) {
        return instance.a(); // ()를 붙여줘야 함
    }
    function change_A(uint256 _value) public  {
        instance.change(_value);
    }    
}