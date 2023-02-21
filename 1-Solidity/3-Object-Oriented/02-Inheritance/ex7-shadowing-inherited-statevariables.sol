// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract A {

    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}


/*
    This will not compile in Solidity 0.6
    Because Shadowing is disallowed in Solidity 0.6

    contract B is A {
        string public name = "Contract B";
    }
*/

contract C is A {

    // how to correctly override inherited state variables ?
    // This is the correct way to override inherited state variables.
    
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}



/*

    Unlike functions, 
    state variables cannot be overridden by re-declaring it in the child contract.
*/