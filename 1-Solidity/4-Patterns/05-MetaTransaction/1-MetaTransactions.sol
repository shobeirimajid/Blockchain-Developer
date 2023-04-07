/*
    -----------------------
    meta transactions
    -----------------------

    https://soliditydeveloper.com/ecrecover
    https://soliditydeveloper.com/meta-transactions
    https://soliditydeveloper.com/erc20-permit
    https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/metatx
    https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/EIP712.sol


    Requiring users to "hold ETH" to "pay for gas" has always been and still is one of the biggest user onboarding challenges. 
    
    Who knows how many more people would be using Ethereum right now if it was just a simple click?
    But sometimes the solution can be added "meta transaction" capability inside your contracts. 
    The implementation might be easier than you think.

    What are meta-transactions?


    A meta transaction is "a regular Ethereum transaction" which "contains another transaction", the actual transaction.

        The actual transaction is "signed" by a user and then sent to an "operator" or something similar, no gas and blockchain interaction required. 
    
        The operator takes this "signed transaction" and "submits" it to the blockchain "paying for the fees" himself.
            The contract "ensures" there's a "valid signature" on the "actual transaction" and then executes it.


    Meta transactions are a way of enabling users to interact with Ethereum smart contracts without paying gas fees directly.
    Gas fees are the costs of executing transactions on the Ethereum network, which depend on the complexity and demand of the computation. 
    Gas fees can be a barrier for new users who want to try out decentralized applications (DApps)
    but do not have enough Ether (ETH) to pay for them.

    Meta transactions solve this problem by allowing users to delegate the payment of gas fees to someone else, 
    usually, a third-party service called a relayer. 
    
    A relayer is a node that listens for meta transactions from users and submits them to the Ethereum network on their behalf, 
    paying for the gas fees with their own ETH.
    In return, the relayer may charge a fee in ETH or tokens from the user or receive some other incentive from the DApp developer.


    



*/