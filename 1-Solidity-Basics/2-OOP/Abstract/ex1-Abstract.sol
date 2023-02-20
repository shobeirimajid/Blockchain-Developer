// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;


/*
    this contract needs to be defined as abstract, 
    because the function utterance() is declared, 
    but no implementation was provided.

    Such abstract contracts can not be instantiated directly.
    This is also true, if an abstract contract itself does implement all defined functions. 
*/

abstract contract Feline {
    function utterance() public virtual returns (bytes32);
}



    
/// The usage of an abstract contract as a base class

abstract contract Animal {
    function utterance() public pure virtual returns (bytes32);
}

contract Cat is Animal {
    function utterance() public pure override returns (bytes32) { 
        return "miaow"; 
    }
}