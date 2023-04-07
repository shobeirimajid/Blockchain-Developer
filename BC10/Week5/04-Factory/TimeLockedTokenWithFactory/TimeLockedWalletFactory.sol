// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./TimeLockedWallet.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeLockedWalletFactory {
 
    mapping(address => address[]) wallets;

    event Created(address wallet, address from, address to, uint createdAt, uint _unlockDuration, uint amount);


    // Prevents accidental sending of ether to the factory
    receive () external payable {
        revert();
    }


    function getWallet(address _user) public view returns(address[] memory) {
        return wallets[_user];
    }


    function newTimeLockedWallet(address _owner, uint _unlockDuration, address _tokenAdr) payable public returns(address wallet) {

        // Create new wallet
        TimeLockedWallet tlw = new TimeLockedWallet(msg.sender, _owner, _unlockDuration);

        wallet = address(tlw);
        
        // Add wallet to sender's wallets
        wallets[_owner].push(wallet);

        // Send ether from this transaction to the created contract.
        payable(wallet).transfer(msg.value);

        // Send 1000 tokens from this transaction to the created contract.
        IERC20 token = IERC20(_tokenAdr);
        token.transfer(wallet, 1000 * 1e18);

        // Emit event.
        emit Created(wallet, msg.sender, _owner, block.timestamp, _unlockDuration, msg.value);
    }
}