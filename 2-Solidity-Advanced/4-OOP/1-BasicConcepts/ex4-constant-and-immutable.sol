// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.4;

uint constant X = 32**22 + 8;                           // file level constant

contract C {

    string constant TEXT = "abc";                       // string constant
    bytes32 constant MY_HASH = keccak256("abc");        // bytes32 constant

    uint immutable decimals;                            // uint immutable
    uint immutable maxBalance;                          // uint immutable
    address immutable owner = msg.sender;               // initialized within declaration

    constructor(uint decimals_, address ref) {
        decimals = decimals_;                           // Assignments to immutables
        maxBalance = ref.balance;                       // Assignments to immutables can even access the environment
    }

    function isBalanceTooHigh(address other) public view returns (bool) {
        return other.balance > maxBalance;
    }
}