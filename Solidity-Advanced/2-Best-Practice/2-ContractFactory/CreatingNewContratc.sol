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


/*
    Description:

    A contract can create other contracts using the new keyword. 
    The full code of the contract being created has to be known when the creating contract is compiled
     so recursive creation-dependencies are not possible.

    As seen in the example, it is possible to send Ether while creating an instance of D using the value option,
     but it is not possible to limit the amount of gas. 
    If the creation fails (due to out-of-stack, not enough balance or other problems), an exception is thrown.

*/