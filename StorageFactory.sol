// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./SimpleStorage.sol";
contract StorageFactory{
     SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public{
       SimpleStorage simpleStorage=new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }
    function sfStore(uint256 simpleStorageIndex, uint256 simpleStorageNumber) public{
        // Way to get the function from other contract
        // simpleStorageArray[simpleStorageIndex].store(simpleStorageNumber);
        SimpleStorage simpleStorage=simpleStorageArray[simpleStorageIndex];// Address and ABI
        simpleStorage.store(simpleStorageNumber);
    }
    function sfGet(uint256 simpleStorageIndex) public view returns(uint256){
        //return simpleStorageArray(simpleStorageIndex).retrieve();
        SimpleStorage simpleStorage=simpleStorageArray[simpleStorageIndex];
        return simpleStorage.retrieve();
    }
    
}