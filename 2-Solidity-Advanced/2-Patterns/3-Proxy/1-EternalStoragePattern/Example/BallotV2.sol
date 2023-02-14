//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;
import "./BallotLibV2.sol";

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

    // modified version
    function vote() public {

        // newly added in v2
        require(externalStorage.getUserHasVoted() == false, "ERR_USER_ALREADY_VOTED");
        externalStorage.setUserHasVoted();

        externalStorage.setVoteCount(externalStorage.getNumberOfVotes() + 1);
    }
}

/*
    Let's say we found a bug, 
    because everyone can vote as many times as they want. 
    We fix it and re-deploy only the Ballot Smart Contract 
    (neglecting that the old version still runs and that there is no way to stop it without extra code).

    You see, only the Library and Ballot changed. 
        The Storage is exactly the same as before. 

    The "Storage Contract" hasn't changed at all, 
        we don't even need to redeploy it. 
        Just use the one that already exists!

    how to deploy the update?
        Re-Deploy the "Ballot" Smart Contract and
        give it the address of the "Storage Contract".
*/