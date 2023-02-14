//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;
import "./BallotLib.sol";

// Business Logic
// can be changed

contract Ballot {
    
    using ballotLib for address;
    address externalStorage;

    constructor(address _externalStorage) {
        externalStorage = _externalStorage;
    }

    function getNumberOfVotes() public view returns(uint) {
        return externalStorage.getNumberOfVotes();
    }

    function vote() public {
        externalStorage.setVoteCount(externalStorage.getNumberOfVotes() + 1);
    }
}