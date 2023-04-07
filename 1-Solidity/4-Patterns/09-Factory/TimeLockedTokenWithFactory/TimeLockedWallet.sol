// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeLockedWallet {

    address public architect;
    address public owner;
    uint public unlockDate;
    uint public createdAt;

    event Received(address from, uint amount);
    event Withdrew(address to, uint amount);
    event WithdrewTokens(address tokenAdr, address to, uint amount);

    constructor(address _architect, address _owner, uint _unlockDuration) {
        architect = _architect;
        owner = _owner;
        createdAt = block.timestamp;
        unlockDate = createdAt + _unlockDuration;
    }


    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this!");
        _;
    }


    // keep all the Ether sent to this address
    receive() payable external { 
        emit Received(msg.sender, msg.value);
    }


    // only owner can withdraw ethers after specified time
    function withdrawEthers() onlyOwner public {

       require(block.timestamp >= unlockDate, "Your wallet doesn't unlocked!");

        // send all the balance
        payable(msg.sender).transfer(address(this).balance);

        emit Withdrew(msg.sender, address(this).balance);
    }


    // only owner can withdraw tokens after specified time
    function withdrawTokens(address _tokenAdr) onlyOwner public {

        require(block.timestamp >= unlockDate, "Your wallet doesn't unlocked!");

        // send all the token balance
        IERC20 token = IERC20(_tokenAdr);
        uint tokenBalance = token.balanceOf(address(this));
        token.transfer(owner, tokenBalance);

        emit WithdrewTokens(_tokenAdr, msg.sender, tokenBalance);
    }


    function info() public view returns(address, address, uint, uint, uint) {
        return (architect, owner, unlockDate, createdAt, address(this).balance);
    }
}