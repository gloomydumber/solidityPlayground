// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;

// lecture 32 - payable, msg.value 과 이더를 전송하는 3가지 함수 (send, transfer, call)

contract lec32 {
    /*
Payable 
Payable은 이더/토큰과 상호작용시 필요한 키워드라고 생각하시면 간단합니다. 
즉, send, trnafer, call을 이용하여, 이더를 보낼때 Payable이라는 키워드가 필요 합니다.
이 Payable은 주로 함수, 주소, 생성자에 붙여서 사용된답니다. 

msg.value
msg.value는 송금보낸 코인의 값 입니다.

이더를 보내는 3가지 함수
  1. send : 2300 gas를 소비, 성공여부를 true 또는 false로 리턴한다 (에러를 반환하지는 못함)
  2. transfer : 2300 gas를 소비, 실패시 에러를 발생 (안전)
  3. call : 가변적인 gas 소비 (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
  재진입(reentrancy) 공격 위험성 있음, 이스탄불 하드포크, 2019년 12월 이후 call 사용을 추천.
  */


  // 이번 영상 보면서 몇가지 질문이 있는데요,
  // 1. (bool sent, ) 로 변수선언된부분은 어떤 문법인지. 어떻게 동작하는것인지?(괄호와 콤마가 어떤 역할을 하는지 궁금합니다)
  // 2. 0.7 버전 이후 call메소드 사용시 객체형태로 인자를 넘겨주는 부분은 어떤 문법인지? ( call{object}(“”); 형태로 되어있는부분)
  // 3. 추가로 가스비가 유동적인 상황에서 지정된 가스비는 위험할수있다고 말씀 주셨는데, 이부분에 대한 이해가 정확히 안되었는데요. 예를들어서 2300으로 고정된 send, transfer같은경우는 가스비가 엄청 오르게되었을때는 전부 실패하는 메소드가 될 수 있는건가요?
  // 4. call메소드의 에러 뱉는 방식의 메소드는 없는지?

  // 1. (bool sent, ) 로 변수선언된부분은 어떤 문법인지. 어떻게 동작하는것인지?(괄호와 콤마가 어떤 역할을 하는지 궁금합니다)
  // 36강을 보시면 궁금점이 바로 해결되실 수 있으실거 같으세요. 
  // call 함수를 통해, 다른 함수를 부를때 결괏값이 bool 타입과 bytes 타입으로 결괏값이 나와요. 
  // "(bool sent, )  = call 함수" 이런식으로 표현한것은 bytes 타입은 받지않고 bool 타입형태만 받겠다 라고 생각하시면됩니다. 

  // 2. 0.7 버전 이후 call메소드 사용시 객체형태로 인자를 넘겨주는 부분은 어떤 문법인지? ( call{object}(“”); 형태로 되어있는부분)
  // 단지, 0.7이후에는 객체로 value 나 gas 값을 넘겨주신다고 생각하시면 됩니다...   
  // 사실, 이 부분에 대해서 제가 뭐라 설명을 드려야 할 지 모르겠네요.
  // 이더리움에서 그렇게 정한거여서요. 

  // 3. 추가로 가스비가 유동적인 상황에서 지정된 가스비는 위험할수있다고 말씀 주셨는데, 이부분에 대한 이해가 정확히 안되었는데요. 
  // 예를들어서 2300으로 고정된 send, transfer같은경우는 가스비가 엄청 오르게되었을때는 전부 실패하는 메소드가 될 수 있는건가요?
  // 네 정확하십니다. 
  // 이더리움 이스탄불 하드포크가 일어나면서 오퍼레이션 코드의 가스 가격이 오르면서 이런 문제가 대두가 되었답니다. 
  // 그래서 call을 쓰기를 권장한다고 합니다!  

  // 4. call메소드의 에러 뱉는 방식의 메소드는 없는지?
  // 네 따로 없어서 call 다음에 require로 success 여부를 판단해줍니다.
  
  event howMuch(uint256 _value);
  function sendNow(address payable _to) public payable{
      bool sent = _to.send(msg.value); // return true or false
      require(sent, "Failed to send either");
      emit howMuch(msg.value);
  }
  
  function transferNow(address payable _to) public payable{
    _to.transfer(msg.value); // transfer 자체적으로 error를 return 할 수 있으므로 error handling이 필요 없음
    emit howMuch(msg.value);
  }

  function callNow (address payable _to) public payable{
    // ~ 0.7
    // (bool sent,) = _to.call.gas(1000).value(msg.value)("");
    // require(sent, "Failed to send either");
    
    //0.7 ~
    (bool sent, ) = _to.call{value: msg.value , gas:1000}(""); // 이스탄불 하드포크 이후에, 가스를 지정해주지 않는 것이 좋다?
    require(sent, "Failed to send Ether");
    emit howMuch(msg.value);
    }
}