// SPDX-License-Identifier: GPL-3.0

// lecture 2 - data type

pragma solidity >=0.7.0 < 0.9.0;
/*
  data type
  boolean, bytes, address, uint
  
  reference type
  string, Arrays, struct
  
  mapping type
*/
contract lec2{
    // public과 같은 접근제한자는 이후의 강의에서 다룰 것
    // bolean : true/false
    bool public b = false;
    
    // ! || == != &&
    bool public b1 = !false; //true
    bool public b2 = false || true; // true
    bool public b3 = false == true; //false
    bool public b4 = false != false; // false
    bool public b5 = false && true; // false
    
    //bytes 1~32
    bytes4 public bt = 0x12345678; // 0x 부분은 hex 표시, charactor 하나당 4bits 이므로, 총 4바이트
    bytes public bt2 = "STRING";
    
    //address 
    address public addr = 0xd9145CCE52D386f254917e481eB44e9943F39138; // address는 20바이트, 즉 40개의 charactors로 이루어짐
    
    // int(음수 포함) Vs uint (음수 안 포함)
    
    //int8 : -2^7 ~ (2^7)-1
    int8 public it = -4;
    //uint8 : 0 ~ 2^8-1
    uint8 public it2 = 123;
    
    //uint256 : 0 ~ 2^256-1
    uint256 public it3 = 123;
}