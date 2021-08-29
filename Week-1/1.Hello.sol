pragma solidity 0.5.16;

contract Hello {
    
    string private helloStr;
    
    constructor() public{
        
        helloStr = "Hello World";
    }
    
    function setHello(string memory hello_) public{
        
        helloStr = hello_;
    }
    
    function getHello() public view returns(string memory) {
        
        return helloStr;
    }
            
}