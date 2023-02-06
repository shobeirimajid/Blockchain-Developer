// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

contract InfoFeed {

    uint8 x;

    function cheapInfo() public payable returns (uint8 ret) { 
        return x;
    }

    function ExpensiveInfo(uint8 x_) public payable returns (uint8 ret) { 
        x = x_;
        return x;
    }
}



contract Consumer {

    InfoFeed feed;

    constructor(InfoFeed addr) payable {
        feed = addr;
    }


    // Simple External Funcion Call
    // If the caller is not contract (is a EOA), doesn't need any gas for call
    function simpleCall() public returns (uint8 result) { 
        return feed.cheapInfo(); 
    }


    // Call along with determined "gas"
    // gas will be paid by the caller account
    function cheapCall(uint gas_) public returns (uint8 result) { 
        return feed.cheapInfo{gas: gas_}(); 
    }


    // Call along with determined "gas" and "value"
    // function is not payable, so amount_ will be paid by this contract (not caller account) 
    // gas will be paid by the caller account
    function expensiveCall(uint8 x_, uint amount_, uint gas_) public returns (uint8 result) { 
        return feed.ExpensiveInfo{value: amount_, gas: gas_}(x_);
    }

}