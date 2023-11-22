//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMeTest is Test // inherit from the Test contract
{
    FundMe fundMe; // global scope for use in other test functions

    function setUp() external {

        fundMe = new FundMe();
    }

    function testMinimumdollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(address(this), fundMe.i_owner());
    }

}