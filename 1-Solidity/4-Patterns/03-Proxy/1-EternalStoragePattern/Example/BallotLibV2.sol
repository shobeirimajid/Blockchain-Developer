//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;
import "./ExternalStorage.sol";

/*
    library does a delegatecall, 
    which executes the libraries code in the context of the Ballot Smart Contract.
    If you were to use msg.sender in the library, 
    then it has the same value as in the Ballot Smart Contract itself.
*/

library ballotLib {

    function getNumberOfVotes(address _externalStorage) public view returns (uint256)  {
        return ExternalStorage(_externalStorage).getUIntValue(keccak256('votes'));
    }

    // newly added in v2
    function getUserHasVoted(address _externalStorage) public view returns(bool) {
        return ExternalStorage(_externalStorage).getBooleanValue(keccak256(abi.encodePacked("voted",msg.sender)));
    }

    // newly added in v2
    function setUserHasVoted(address _externalStorage) public {
        ExternalStorage(_externalStorage).setBooleanValue(keccak256(abi.encodePacked("voted",msg.sender)), true);
    }

    function setVoteCount(address _externalStorage, uint _voteCount) public {
        ExternalStorage(_externalStorage).setUIntValue(keccak256('votes'), _voteCount);
    }
}
