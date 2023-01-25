// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./PriceConverter.sol";
contract FundMe{
    using PriceConverter for uint256;
    uint256 public minimumUsd=50*1e18;
    address[] public funders; // Creating an Array of funders
    mapping(address=>uint256) public addressToAmountFunded;// mapping the funders to the amount they sent
    function fund() public  payable{
       // require(getConversionRate(msg.value) > 1e18,"Didn't Send enough"); //We want value to be greater than 50 USD
        require(msg.value.getConversionRate() > 1e18,"Didn't Send enough"); // when using library
        funders.push(msg.sender);//pushing the funders to the array
        addressToAmountFunded[msg.sender]=msg.value;

    }
   

   
}