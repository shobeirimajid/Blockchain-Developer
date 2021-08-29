pragma solidity 0.5.16;

contract Ballot {
    
    struct Voter {
        bool voted;
        uint8 weight;
        uint8 proposalID;
    }
    
    struct Proposal {
        uint8 voteCount;
    }
    
    Proposal[] proposals; 
    mapping(address => Voter) voters;                                             
    address chairperson;
    
    constructor(uint8 proposalCnt) public {
        
        chairperson = msg.sender;
        
        voters[chairperson].weight = 2;
        voters[chairperson].voted = false;
        
        proposals.length = proposalCnt;
    }
    
    function register(address voterAdd) public {
        
        require(msg.sender == chairperson);
        require(voters[voterAdd].voted != true);
        
        voters[voterAdd].weight = 1;
        voters[voterAdd].voted = false;
    }
    
    function vote(uint8 proposalID) public {
        
        Voter storage sender = voters[msg.sender];
       
        require(sender.voted == false);
        require(proposalID < proposals.length);
       
        sender.voted = true;
        sender.proposalID = proposalID;
       
        proposals[proposalID].voteCount += sender.weight;
    }
    
    
    function winningProposal() public view returns(uint8 winProp_) {
        
        uint8 winProp = 0;
        
        for (uint8 i = 0; i < proposals.length; i++) {
            
            if(proposals[i].voteCount > winProp) {
                winProp = proposals[i].voteCount;
                winProp_ = i;
            }   
        }   
    }
}
