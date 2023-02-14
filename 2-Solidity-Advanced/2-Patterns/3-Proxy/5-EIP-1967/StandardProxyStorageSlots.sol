/*
    ---------------------------------------------
    EIP-1967: Standard Proxy Storage Slots
    ---------------------------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/09-eip-1967/

    This EIP standardizes how proxies store the logic contract address. 

    Having this makes it easier for outside services, such as block explorers, 
        to show the correct information to the end-user. 
    Etherscan added support for this end of 2019. 

    The EIP-1967 also adds a few more gimmicks to the overall pattern!

    What's the main function? 
    The storage slot, obviously.
    While in EIP-1822 it was somewhat 
        keccak256("PROXYABLE") - 
        or anything of your choice really - 
        in EIP-1967 it is well defined:

    Storage slot 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc
        (obtained as bytes32(uint256(keccak256('eip1967.proxy.implementation')) - 1)) 
        is reserved for the logic contract.

    EIP-1967 also adds "beacon contracts" and "storage" for the actual "admin functionality"

*/