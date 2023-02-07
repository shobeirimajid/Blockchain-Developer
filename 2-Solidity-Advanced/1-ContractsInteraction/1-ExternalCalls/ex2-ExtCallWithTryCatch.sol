// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

contract InfoFeed {

    uint8 x;
    error Invalid();

    function cheapInfo() public payable returns (uint8 ret) { 
        return x;
    }

    function ExpensiveInfo(uint8 x_) public payable returns (uint8 ret) { 
        
        if (x_ < 5)
            revert Invalid();

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


    // Exception Handling
    function callWithTryCatch(uint gas_, uint8 x_) public returns (
        uint result, 
        bool success,
        string memory,  //reason
        uint,           //errorCode
        bytes memory    //lowLevelData
        ) { 

        try feed.ExpensiveInfo{gas: gas_}(x_) returns (uint8 ret) {
            return (ret, true, "", 0, "");

        // This is executed in case "revert" was called "inside ExpensiveInfo"
        // and a reason string was provided.
        } catch Error(string memory reason) {
            return (0, false, reason, 0, "");

        // This is executed in case of a panic (a serious error like division by zero or overflow) 
        // The error code can be used to determine the kind of error.
        } catch Panic(uint errorCode) {
            return (0, false, "", errorCode, "");

        // This is executed in case revert() was used.
        } catch (bytes memory lowLevelData) {
            return (0, false, "", 0, lowLevelData);
        }

    }

}