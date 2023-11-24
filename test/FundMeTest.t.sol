//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";


contract FundMeTest is Test // inherit from the Test contract
{
    FundMe fundMe; // global scope for use in other test functions

    function setUp() external {

        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumdollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(msg.sender, fundMe.i_owner());
    }

    function testPriceVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }

    // how to work with addresses outside our testing system
    // 1. Unit testing
        // testing a specific part of our code
    // 2. Integration
        // testing how our code works with other parts of our code
    // 3. Forked
        // testing our code on a simulated real environment
    // 4. Staging
        // testing our code in a real environment that is not production

    




}