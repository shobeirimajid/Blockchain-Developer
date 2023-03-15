// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

contract CheckGas {

    uint i;

    function checkStrict() external {
        i=0;
        require(i < 1);
        // LT  : 3 Gas
    }

    function checkNonStrict() external {
        i=0;
        require(i <= 1);
        // GT       : 3 Gas
        // ISZero   : 3 Gas
    }
}