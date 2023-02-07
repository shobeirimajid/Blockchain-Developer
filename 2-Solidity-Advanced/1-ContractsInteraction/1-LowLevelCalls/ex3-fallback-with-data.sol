// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;


// Source -> Caller -> Target



contract Target {

    uint public count;

    function get() external view returns (uint) {
        return count;
    }

    function inc() external returns (uint) {
        return ++count;
    }
}



contract Caller {

    address immutable targetAdr;

    event NewCallRequest(address indexed Source, bytes data);

    constructor(address payable target_) {
        targetAdr = target_;
    }

    fallback(bytes calldata data) external payable returns (bytes memory) {

        (bool ok, bytes memory res) = targetAdr.call(data);
        require(ok, "call failed");
        
        emit NewCallRequest(msg.sender, data);

        return res;
    }
}



contract Source {

    address immutable callerAdr;

    event Log(bytes new_Called_Counter);

    constructor(address caller_) {
        callerAdr = caller_;
    }

    // calling the Caller.fallbacl()
    function call_Fallback(bytes calldata data) external {

        (bool sent, bytes memory result) = callerAdr.call(data); 
        require(sent, "call failed"); 

        emit Log(result);
    }

    function getTestData() external pure returns (bytes memory) {
        return abi.encodeWithSignature("inc()");
    }
}