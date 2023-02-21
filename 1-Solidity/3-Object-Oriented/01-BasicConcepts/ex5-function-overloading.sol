// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

    // this  example shows overloading of the function f in the scope of contract A

contract A {

    function f(uint value) public pure returns (uint out) {
        out = value;
    }

    function f(uint value, bool really) public pure returns (uint out) {
        if (really)
            out = value;
    }
}




/*
    This will not compile
        Both f function accepting the address type for the ABI 
        although they are considered different inside Solidity
*/
    
contract B {

    function f(A value) public pure returns (A out) {
        out = value;
    }

    function f(address value) public pure returns (address out) {
        out = value;
    }
}





/*
    Calling f(50) would create a type error 
    since 50 can be implicitly converted both to uint8 and uint256 types. 
    On another hand f(256) would resolve to f(uint256) overload as 256 cannot be implicitly converted to uint8.
*/

contract C {
    function f(uint8 val) public pure returns (uint8 out) {
        out = val;
    }

    function f(uint256 val) public pure returns (uint256 out) {
        out = val;
    }
}

