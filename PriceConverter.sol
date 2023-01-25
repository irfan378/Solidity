// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
     function getPrice() internal  view returns(uint256){
        // Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,)=priceFeed.latestRoundData();
        return uint256(price * 1e10); //1**10=10000000000 //getting the price of ether in dollars
    }
    function getConversionRate(uint256 ethAmount)internal view returns(uint256){
        // converting amount sent in eth to USD
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd=(ethPrice*ethAmount)/1e18;
        return ethAmountInUsd;
    }
}