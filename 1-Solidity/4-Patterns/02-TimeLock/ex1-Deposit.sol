// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// you can deposit ether into this contract 
// but you must wait 1 week before you can withdraw your funds

import "@openzeppelin/contracts/access/Ownable.sol";


contract Timelock is Ownable { 

    uint public immutable lockDuration = 1 weeks;

    // amount of ether you deposited is saved in balances
    mapping(address => uint) public balances;
  
    // when you can withdraw is saved in lockTime
    mapping(address => uint) public lockTime;


    function deposit() external payable {
        // update balance
        balances[msg.sender] += msg.value;

        // updates locktime 1 week from now
        lockTime[msg.sender] = block.timestamp + lockDuration;
    }


    function withdraw() public {

        // check that the sender has ether deposited in this contract in the mapping and the balance is >0
        require(balances[msg.sender] > 0, "insufficient funds");

        // check that the now time is > the time saved in the lock time mapping
        require(block.timestamp > lockTime[msg.sender], "lock time has not expired");

        // update the balance
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        // send the ether back to the sender
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send ether");
    }


    function increaseLockTime(address _account, uint _seconds) public onlyOwner {
        lockTime[_account] += _seconds;
    }  


    function decreaseLockTime(address _account, uint _seconds) public onlyOwner {
        lockTime[_account] -= _seconds;
    }  
}