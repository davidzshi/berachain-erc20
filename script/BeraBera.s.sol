// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/berabera.sol"; // Adjust the path based on your project structure

contract DeployBeraBera is Script {
    function run() public {
        vm.startBroadcast(); // Start broadcasting transactions

        // Deploy the BeraBera contract
        // The constructor of BeraBera is called automatically when deploying
        BeraBera beraBera = new BeraBera();

        vm.stopBroadcast(); // Stop broadcasting transactions

        // Log the address of the deployed contract
        console.log("BeraBera deployed at:", address(beraBera));
    }
}
