/**
    ExceptionHandling by try/catch
        https://docs.soliditylang.org/en/v0.8.18/control-structures.html#try-catch

    Solidity also supports exception handling in the form of "try/catch-statements", 
        but only for "external function calls" and "contract creation calls". 
        Errors can be created using the "revert" statement.
*/

/// A failure in an "external call" can be caught using a try/catch statement, as follows:



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.1;


interface DataFeed { 
    function getData(address token) external returns (uint value); 
}



contract FeedConsumer {

    DataFeed feed;
    uint errorCount;

    function rate(address token) public returns (uint value, bool success) {

        // Permanently disable the mechanism if there are more than 10 errors.
        require(errorCount < 10);

        try feed.getData(token) returns (uint v) {
            return (v, true);

        // This is executed in case "revert" was called "inside getData"
        // and a reason string was provided.
        } catch Error(string memory reason) {
            errorCount++;
            return (0, false);

        // This is executed in case of a panic (a serious error like division by zero or overflow) 
        // The error code can be used to determine the kind of error.
        } catch Panic(uint errorCode) {
            errorCount++;
            return (0, false);

        // This is executed in case revert() was used.
        } catch (bytes memory lowLevelData) {
            errorCount++;
            return (0, false);
        }

    }
}



/**
    The "try" keyword has to be followed by an expression representing an :
        - external function call
        - contract creation --- new ContractName()

    "Errors" inside the expression are not caught
        for example 
            if it is a "complex expression" that also involves "internal function calls"
        only a "revert" happening inside the external call itself. 
        
    The returns part (which is optional), return "variables" matching the "types returned by the external call". 
    
    In case there was no error, 
        these variables are assigned and the contract’s execution continues inside the first success block. 
    If the end of the success block is reached, 
        execution continues after the catch blocks.


    Solidity supports different kinds of catch blocks, that their execution, depends on the type of the error:


        1. catch Error(string memory reason) { ... }

            If the error was caused by :
                - revert("reasonString") 
                - require(false, "reasonString") 
                - or an internal error that causes such an exception


        2. catch Panic(uint errorCode) { ... }

            If the error was caused by a "panic" :
                - failing assert
                - division by zero
                - invalid array access
                - arithmetic overflow 
                - and others


        3. catch (bytes memory lowLevelData) { ... }
        
            If 
                - the error signature does not match any other clause
                - there was an error while decoding the error message
                - if no error data was provided with the exception. 

            The declared variable (lowLevelData) provides access to the "low-level error" data in that case.


        4. catch { ... }
        
            If you are not interested in the error data, 
                you can just use catch { ... } (even as the only catch clause) instead of the previous clause.
                 

    It is planned to support other types of error data in the future. 
    The strings "Error" and "Panic" are currently "parsed" as is and "are not treated as identifiers".

    In order to "catch all error" cases, 
        you have to have at least the clause 
            catch { ...} 
        or the clause 
            catch (bytes memory lowLevelData) { ... }

    The variables declared in the returns and the catch clause are only in scope in the block that follows.


    Note:
        If an error happens during the "decoding of the return data" inside a "try/catch-statement", 
            this causes an "exception" in the currently executing contract 
            and because of that, "it is not caught in the catch" clause. 
            
        If there is an error during "decoding of catch Error" (string memory reason) and there is a "low-level catch clause", 
            this error is caught in the "low-level catch clause".

    Note:
        If execution reaches a "catch-block"
            then the "state-changing" effects of the "external call" have been reverted. 

        If execution reaches the "success block"
            the effects were not reverted. 
            
        If the "effects" have been "reverted"
            then execution either 
                - continues in a catch block 
                - or the execution of the "try/catch statement" itself reverts 
                    for example due to:
                        * decoding failures as noted above 
                        * or due to not providing a low-level catch clause.


    Note:
        The reason behind a "failed call" can be manifold.

        Do not assume that the error message is coming directly from the called contract: 
            The error might have happened deeper down in the "call chain" and the called contract just forwarded it. 

        Also, it could be due to an "out-of-gas" situation and not a deliberate error condition: 
            The caller always keep(retains) at least 1/64th of the gas in a call 
            and thus even if the called contract goes out of gas, the caller still has some gas left.

*/