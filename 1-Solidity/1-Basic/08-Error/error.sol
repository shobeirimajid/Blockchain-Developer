/*
    --------------------------------
    Errors and the Revert Statement
    --------------------------------
    https://docs.soliditylang.org/en/latest/contracts.html#errors-and-the-revert-statement

    Errors in Solidity provide a convenient and "gas-efficient" way 
    to explain to the user why an operation failed. 
    
    They can be defined inside and outside of contracts (including interfaces and libraries).

    They have to be used together with the revert statement 
    which causes all changes in the current call to be reverted 
    and passes the error data back to the caller.


    require(condition, "description");      equivalent to       error Error(string)
                                                                if (!condition) 
                                                                revert Error("description")

    Members of Errors:
    
        error.selector    - A bytes4 value containing the error selector.





*/