pragma solidity 0.5.16;

contract StateTransition {
    
    uint256 thisTime;
    
    enum Stage {
        Init,
        Reg,
        Vote,
        Done
    }
    
    Stage public stage;
    
    constructor () public
    {
       stage = Stage.Init;
       thisTime = now;
    }
    
    function setStage() public {
        
        if(now < (thisTime + 10 seconds))
            stage = Stage.Init;
            
        else if(now < (thisTime + 20 seconds))
            stage = Stage.Reg;
            
        else if(now < (thisTime + 30 seconds))
            stage = Stage.Vote;
        
        else
            stage = Stage.Done;
            
        thisTime = now;
        
        /*
            1 == 1 seconds
            1 minutes == 60 seconds
            1 hours == 60 minutes
            1 days == 24 hours
            1 weeks == 7 days
            1 years == 365 days
        */
    }
    
    function getStage() public view returns(Stage)
    {
        return stage;
    }
    
}