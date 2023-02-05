// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SimpleContract {
    uint public x;
    constructor(uint a) payable {
        x = a;
    }
}

contract Factory {
    /// to hold address of new contract that will be created
    address public newSCAdr;

    /**
      Simply Create a new contract with SimpleContract's Code
      and send "a_" as its constructor's input parameter.
    */
    function createNewContract(uint a_) public {
        // Create a new contract from SimpleContract and executed its constructor
        SimpleContract newSC = new SimpleContract(a_);
        // get contract's address
        newSCAdr = address(newSC);
    }

    /**
      Simply create a new contract with SimpleContract's code,
       send "a_" as its constructor's input parameter,
       send "amount" along with the creation.
    */ 
    function createAndCharge(uint a_, uint amount) public payable {
        // Create a new contract from SimpleContract, send value to it and executed its constructor
        SimpleContract newSC = new SimpleContract{value: amount}(a_);
        // get contract's address
        newSCAdr = address(newSC);
    }

    function getNewContractInfo() public view returns(uint newSC_x, uint newSC_balance) {
        // return new contract's public variable x
        newSC_x = SimpleContract(newSCAdr).x();
        newSC_balance = newSCAdr.balance;
    }
}