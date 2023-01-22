// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMe{
    function fund() public  payable{
        require(msg.value > 1e18,"Didn't Send enough"); //We want value to be greater than 1 eth
    }
    function getPrice() public view returns(uint256){
        // Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,)=priceFeed.latestRoundData();
        return uint256(price * 1e10); //1**10=10000000000
    }
   
}