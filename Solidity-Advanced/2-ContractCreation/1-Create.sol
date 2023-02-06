// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SimpleContract {

    address public creator;

    constructor(address _creator) payable {
        creator = _creator;
    }
}



contract Factory {

    // to hold instance of new contract
    SimpleContract newSC;

    constructor() payable {}


    // Create a new contract with SimpleContract's Code 
    // execute its constructor
    // send address of Factory as its constructor's input parameter

    function createNewContract() public {
        newSC = new SimpleContract(address(this));
    }
    

    // Same as the previous version, Also:
    //  send "value" along with the creation
    //  get "value" from the "caller"

    function createAndCharge() public payable {
        newSC = new SimpleContract{value: msg.value}(address(this));
    }


    // Same as the previous version, But
    //  charges the new contract by the current contract balance, Instead of get value from the caller
    //  Contract have to be charged already.

    function createAndCharge(uint amount) public {
        newSC = new SimpleContract{value: amount}(address(this));
    }


    // return new contract's Info
    function getNewContractInfo() public view returns(
        address newSC_Adr, 
        address newSC_creator, 
        uint newSC_balance
    ) {
        newSC_Adr = address(newSC);
        newSC_creator = newSC.creator();
        newSC_balance = address(newSC).balance;
    }
}