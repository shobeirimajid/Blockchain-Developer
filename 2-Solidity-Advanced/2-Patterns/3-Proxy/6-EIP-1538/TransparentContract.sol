/*
    ---------------------------------------------
    EIP-1538: Transparent Contract Standard
    ---------------------------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/10-eip-1538-transparent-contract-standard/

    Now it's time to talk about two things: 

        EIP-1538: Transparent Contract Standard - https://eips.ethereum.org/EIPS/eip-1538
        EIP-2535: Diamond Standard - https://eips.ethereum.org/EIPS/eip-2535

    EIP-2535 replaces EIP-1538 and both were created by Nick Mudge, 
        so we will briefly touch on the idea of EIP-1538 without going into too much detail, 
        just to understand what's going on.

    This was the first implementation, which does something very clever: 
        Instead of defining a logic contract as a whole, 
        it basically extracts the functions of logic contracts and sets an address for it.

    This way you can have as many logic contracts as you want, and update functions incrementally.

    A sample implementation can be seen in this repository:
        https://github.com/mudgen/transparent-contracts-erc1538/tree/master/contracts

    I will explain how it works, but not further dive into EIP-1538, 
        because it was withdrawn and superseded by EIP-2535.

    From the test case, you see it all revolves around "MyTransparentContract", 
        which also contains the fallback function that does the delegatecall. 
        It gets the address of ERC1538Delegate, which contains functionality to 
        map function-signatures (bytes4) to addresses.

    Later, the fallback function in MyTransparentContract will use lookups to determine 
    which function signature runs on which address 
    and does the delegatecall from within the MyTransparentContract.

    It needs quite a bit of setup: 
        For example for an ERC20 Token, you would need to give it all function signatures 
        that are running on the ERC20 address and 
        add it to the mappings through MyTransparentContracts updateContract 
        which is the logic used from ERC1538Delegate.

    It's quite complex to understand and, 
    at least in my opinion, does solve only one thing: 
    You can get around the 24KB maximum contract size limitation.

    I might be wrong, but I don't see gas savings by adding functions atomically, 
        because to upgrade a function I would still need to deploy the whole contract first. 
        I do understand that you can get around this to some extend, 
        by providing virtual functions, 
        but not enough to count as atomic updates for my understanding. 
        So, for example, if you deploy a mintable ERC20 contract 
        and you want to change the mint-function somehow, 
        you would still need to re-deploy the whole ERC20 contract 
        with all the functions the mint function depends on, 
        including the new mint function, to change it.

    But it seems Nick Mudge came up with a better solution. 
    So, let's talk about Diamonds...

*/