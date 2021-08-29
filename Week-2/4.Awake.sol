pragma solidity 0.5.16;

contract Awake {
    
    address public owner;
    
    struct Member {
        bool isMember;
        bool isAwake;
        bool isPaid;
    }
    
    mapping(address => Member) members;
    
    uint8 memberCount = 0;
    uint8 awakeCount = 0;
    uint256 share = 0;
    
    constructor() public {
	
        owner = msg.sender;
    }
    
    function registerMe() public payable{
        
        /*
            1 wei == 1
            1 szabo == 1e12;    10 ** 12 wei
            1 finney == 1e15;   10 ** 15 wei
            1 ether == 1e18;    10 ** 18 wei
        */
            
        require(msg.value == 1e18);
        // require(members[msg.sender].isMember != true);
        require(! members[msg.sender].isMember);
        
        members[msg.sender].isMember = true;
        members[msg.sender].isAwake = false;
        members[msg.sender].isPaid = false;
        
        memberCount ++;
    }  
     
    function iAmAwake() public {
        
        require(members[msg.sender].isMember);        
        members[msg.sender].isAwake = true;       
        awakeCount ++;
    }
   
    function payMyAward() public {
        
        require(members[msg.sender].isAwake);
        require(!members[msg.sender].isPaid);
        require(awakeCount != 0);
        
        share = address(this).balance / awakeCount;
        members[msg.sender].isPaid = true;
      
        msg.sender.transfer(share);
    }    
    
    function getContractAdd() public view returns (address) {
        
        return address(this);
    }
    
    function getContractBalance() public view returns (uint256) {
        
        return address(this).balance;
    }
    
    function getMyBalance() public view returns (uint256) {
        
        return msg.sender.balance;
    }   
}