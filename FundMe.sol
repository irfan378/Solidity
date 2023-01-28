// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./PriceConverter.sol";
error NotOwner();
contract FundMe{
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD=50*1e18;
    address[] public funders; // Creating an Array of funders
    mapping(address=>uint256) public addressToAmountFunded;// mapping the funders to the amount they sent
    address public immutable i_owner;
    constructor(){
        i_owner=msg.sender;
    }
    function fund() public  payable{
       // require(getConversionRate(msg.value) > 1e18,"Didn't Send enough"); //We want value to be greater than 50 USD
        require(msg.value.getConversionRate() > 1e18,"Didn't Send enough"); // when using library
        funders.push(msg.sender);//pushing the funders to the array
        addressToAmountFunded[msg.sender]+=msg.value;

    }
    function withdraw() public onlyOwner{
        // require(msg.sender==owner,"Sender is not owner");
        for (uint256 funderIndex=0; funderIndex<funders.length; funderIndex++){
            address funder=funders[funderIndex];
            addressToAmountFunded[funder]=0;
        }
        //reset the array
        funders=new address[](0);
        // withdraw the funds
        //transfer
        // payable(msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSucess=payable(msg.sender).send(address(this).balance);
        // require(sendSucess,"Send Failed");
        // call
        // (bool callSucess,bytes memory dataReturned)=payable(msg.sender).call{value:address(this).balance}("");
            (bool callSucess,)=payable(msg.sender).call{value:address(this).balance}("");
            require(callSucess,"Call Falied");
    }
   modifier onlyOwner{
    //    require(msg.sender==i_owner,"Sender is not owner!");
    if(msg.sender!=i_owner){
        revert NotOwner();
    }
       _; // rest of the code
   }

   
}