// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

interface IToken {

    enum TokenType { 
        Fungible, 
        NonFungible 
    }

    struct Coin { 
        string obverse; 
        string reverse; 
    }

    /*
        Types defined inside interface can be accessed from other contracts: 
            IToken.TokenType
            IToken.Coin
    */

    function transfer(address recipient, uint amount) external;
}



interface IParentA {
    function test() external returns (uint256);
}


interface IParentB {
    function test() external returns (uint256);
}

interface ISubInterface is IParentA, IParentB {

    // Must redefine test in order to assert that the parent meanings are compatible.

    function test() external override(IParentA, IParentB) returns (uint256);
}



