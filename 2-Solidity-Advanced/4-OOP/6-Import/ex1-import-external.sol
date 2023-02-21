
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

// or

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Import is Ownable {

    constructor() payable {

    }

    // only the owner can call destruct()!
    // If onoter account call this function  ->     revert  
    //                                              "Ownable: caller is not the owner"
    function destruct() public onlyOwner {

        address payable _owner = payable(owner());

        selfdestruct(_owner);
    }
}


// https://docs.openzeppelin.com/contracts/2.x/access-control
// By default, the owner of an Ownable contract is the account that deployed it
