// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

contract Receiver {

    string result = "jobe done!";

    function getResult() external view returns(string memory) {
        return result;
    }

    receive() external payable {}

    fallback(bytes calldata data) external payable returns(bytes memory) {
        (bool ok, bytes memory res) = address(this).staticcall(data);
        require(ok, "call failed");
        return res;
    }
}


/*
    The staticcall is a "secure" version of "call"
        it allows a contract to call another contract (or itself) without modifying the state.
        staticcall can not send value and is just to call without any change on state.

    One of the main reasons to use staticcall is to avoid "reentrancy" vulnerabilities.

    staticall throw exceptions if the opcodes :
        - tries to deploy a new contract (CREATE and CREATE2)
        - emits logs (LOG0, LOG1, LOG2, LOG3, LOG4)
        - makes state changes (SSTORE)
        - anything that uses call() with a value (sending eth)
*/


contract Sender {

    address immutable receiverAdr;
    event Response(bool status, bytes data);

    constructor(address receiver_) {
        receiverAdr = receiver_;
    }

    // call the getResult()
    function call_getResult() public view returns(bool success, bytes memory result) {
        (success, result) = receiverAdr.staticcall(abi.encodeWithSignature("getResult()"));
        require(success, "Failed to send Ether");
    }

    // call the receive()
    function call_receive() public view returns(bool success, bytes memory result) {
        (success, result) = receiverAdr.staticcall("");
        require(success, "Failed to send Ether");
    }

    // call the fallbacl() with data
    function call_Fallback(bytes calldata data) public view returns(bool success, bytes memory result) {
        (success, result) = receiverAdr.staticcall(data); 
        require(success, "call failed"); 
    }
    
    function getTestData() external pure returns (bytes memory) {
        return abi.encodeWithSignature("getResult()");
    }
}


/*
    byte to string converter
    
    https://onlinestringtools.com/convert-bytes-to-string
*/