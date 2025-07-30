// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address alice = makeAddr("Alice");
    address bob = makeAddr("Bob");

    uint256 constant initialSupply = 1000 ether; // Adjust the initial supply as needed

    uint256 public constant STRING_BALANCE = 100 ether; // Adjust the initial supply as needed

    function setUp() public {
        // This function would contain the setup logic for the test
        // For example, deploying the OurToken contract
        DeployOurToken deployCode = new DeployOurToken();
        ourToken = deployCode.run();

        // vm.prank(address(deployer));
        vm.prank(msg.sender);
        ourToken.transfer(bob, STRING_BALANCE); // Transfer some tokens to Alice
    }

    function testInitialSupply() public {
        // This function would contain the logic to test the initial supply of OurToken
        // For example, you could deploy the contract and check the balance of the deployer
    }

    function testBobBalance() public {
        // DeployOurToken deployOurToken = new DeployOurToken();
        // ourToken = deployOurToken.run();
        assertEq(
            ourToken.balanceOf(bob),
            STRING_BALANCE,
            "Bob should have the initial balance"
        );
    }

    function testAllowanceWorks() public {
        // This function would contain the logic to test the allowance functionality
        // For example, you could approve a spender and check the allowance
        uint256 initialAllowanceAmount = 1000; // Adjust the allowance amount as needed
        vm.prank(bob);
        ourToken.approve(alice, initialAllowanceAmount);

        uint256 transferAmount = ourToken.allowance(bob, alice);
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);

        assertEq(
            ourToken.balanceOf(alice),
            initialAllowanceAmount,
            "Alice should have the transferred balance"
        );
    }
}
