// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Sink {

    event Received(address, uint);

    // This function is called for plain Ether transfers, 
    // i.e. for every call with "empty calldata".
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}