// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public favNumber;// changed its visibility to publiv

function store(uint256 _favouriteNumber) public{
    favNumber=_favouriteNumber; //public keywoard makes the function Public
    // uint256 testVar=5;
}
// function something() public {
//     testVar=6; //we cannot access it here,
// }

}