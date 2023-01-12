// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public favNumber;// changed its visibility to public
//Structs
People public person=People({favNumber:2,name:"abc"});
struct People{
    uint256 favNumber;
    string name;
}
//Arrays
People[] public people;//Dynamic Array
// People[3] public people;//fix sized Array
//mapping
mapping(string => uint256) public nameToFavouriteNumber;
//Functions
function store(uint256 _favouriteNumber) public{
    favNumber=_favouriteNumber; //public keywoard makes the function Public
    // uint256 testVar=5;
}
// function something() public {
//     testVar=6; //we cannot access it here,
// }
function retrieve() public view returns(uint256){
    return favNumber;
}
function add() public pure returns(uint256){
    return(1+1);
}
// Add People to arrays
function addPerson(string memory _name,uint256 _favouriteNumber) public{
    // People memory newPerson=People(_favouriteNumber,_name);
    People memory newPerson=People({favNumber:_favouriteNumber,name:_name});
    // people.push(_favouriteNumber,_name)
    people.push(newPerson);
    nameToFavouriteNumber[_name]=_favouriteNumber;

}


}