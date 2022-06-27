// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// lecture 24 - linear search
// 배열을 순회하면서, 인자로 들어온 값이 어디에 존재하는지 찾아내서 해당 인덱스 값을 반환

contract lec24{
  event CountryIndexName(uint256 indexed _index, string _name);
  string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"]; 
  //Taiwan
  function linearSearch(string memory _search) public view returns(uint256, string memory){
    // ⭐ 단순 string은 Solidity 내에서 비교 불가 ⭐
    // string을 비교하려면, keccak256 해시 함수를 이용해서 비교해야함
    for(uint256 i = 0; i < countryList.length; i++){
        if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search))){
          return (i, countryList[i]);
        }
    }
    return(0, "Nothing");
  } 
}