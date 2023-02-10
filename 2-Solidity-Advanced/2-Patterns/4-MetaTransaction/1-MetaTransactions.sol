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





    



*/