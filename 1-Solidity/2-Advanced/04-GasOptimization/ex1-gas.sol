// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Gas {

    uint public i = 0;

    function forever() public {

        // Here we run a loop until all of the gas are spent and the transaction fails

        while (true) {
            i += 1;
        }
    }
}