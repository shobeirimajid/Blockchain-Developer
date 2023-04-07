/*
    ----------------------------------------
    2. upgradeable
    ----------------------------------------  
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/05-proxy-nick-johnson/

    The first proxy that was ever proposed, came from "Nick Johnson". 
    If you don't know him, he's founder and lead dev at the ENS (Ethereum Name Service). 

    The proxy looks like this.
    https://gist.github.com/Arachnid/4ca9da48d51e23e5cfe0f0e14dd6318f

    I believe it was written for Sol 0.4.0 (or alike), 
        since later Solidity version would require function visibility specifiers and an actual pragma line.

    So, here is a copy of the same Smart Contract ported to Solidity 0.8.1 
        and stripped of any comments and the replace-method made public 
        so that we can actually replace Smart Contracts. 
        
    Again, it's a simplified version without any governance or control, 
    simply showing the upgrade architecture:

    Upgradeable has a delegatecall to the Example Smart Contract. 

    delegatecall is a special variant of a message call, which is identical to a message call 
        apart from the fact that the code at the target address is executed in the context of the calling contract 
        and msg.sender and msg.value do not change their values.

         Instead of running the code of the target contract on the target contracts address, 
         we're running the code of the target contract on the contract that called the target. 


    Let's play around and you see where this is going:

        1.Deploy Example
        2.Deploy the Dispatcher using the Example address as the Dispatchers constructor argument.
        3.Tell Remix that the Example Contract is now running on the Dispatcher address.
    

*/