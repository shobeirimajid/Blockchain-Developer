// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

/**
    An example of a basic wallet.
        Anyone can send ETH.
        Only the owner can withdraw.
*/

contract EtherWallet {

    address payable public owner;


    constructor() {
        owner = payable(msg.sender);
    }


    receive() external payable {}


    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
