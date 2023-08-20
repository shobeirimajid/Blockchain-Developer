// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "hardhat/console.sol";

contract Greeter {
    string greeting;

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }
}