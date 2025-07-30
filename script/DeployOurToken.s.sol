// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
// import "../src/ManualToken.sol";
import "../src/OurToken.sol";

contract DeployOurToken is Script {
    uint256 initialSupply = 1000 ether; // Adjust the initial supply as needed

    function run() external {
        vm.startBroadcast();

        new OurToken(initialSupply);

        vm.stopBroadcast();
    }
}
