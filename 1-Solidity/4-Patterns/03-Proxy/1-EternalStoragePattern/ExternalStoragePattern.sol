/*
    ----------------------------------------
    1. "Eternal Storage" Pattern - without Proxy 
    ----------------------------------------    
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/04-eternal-storage/
    
    The first thing to tackle is the "loss of data" during "re-deployment". 
    What comes to mind is to separate "logic" from "storag"e. 
    The question is how are we doing that?

    In the Eternal Storage pattern, we move the "storage" with setters and getters to a separate Smart Contract 
        and let only read/write the "logic" Smart Contract from it.

    This can be a Smart Contract which deals with exactly the variables you need, 
        or you generalize by variable types. 

    This is a simple voting Smart Contract. 
        You call vote() and increase a number - pretty basic business logic.  

    First we need to deploy the "Eternal Storage". 
        This contract remains a constant and isn't changed at all.

    Then we deploy the "Ballo"t" Smart Contract, 
        which will take the library and the Ballot Contract to do the actual logic.

    Under the hood, a library does a delegatecall, 
        which executes the libraries code in the context of the Ballot Smart Contract. 
    
    If you were to use msg.sender in the library, 
        then it has the same value as in the Ballot Smart Contract itself.

    Let's say we found a bug, because everyone can vote as many times as they want. 
        We fix it and re-deploy only the "Ballot" Smart Contract 
        (neglecting that the old version still runs and that there is no way to stop it without extra code).

    this has some advantages and some disadvantages.

        ➕ Relatively easy to understand: 
            It doesn't involve any assembly magic at all. 
            If you come from traditional software development, these patterns should look fairly familiar.

        ➕ Would also work without Libraries, 
            just a Storage Smart Contract running under its own address.

        ➕ Eliminates the Storage Migration after Contract Updates.

        〰️ Address of Contracts change
            this can also be good for transparency reasons. 
            E.g. you run an online service and fees change for new signups.

        ➖ Quite difficult access pattern for variables.

        ➖ Doesn't work out of the box for existing Smart Contracts like Tokens etc.
*/