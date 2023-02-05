/**
    Special Functions
        https://docs.soliditylang.org/en/v0.8.18/contracts.html#special-functions

    Receive Ether Function

        A contract can have at most one receive function, declared using :

            receive() external payable { ... } 
                without the function keyword. 

        This function:
            - cannot have arguments
            - cannot return anything 
            - must have "external" visibility 
            - must have "payable" state mutability
            - can be virtual
            - can override
            - can have modifiers

        The "receive function" is executed :

            1- on a "call to the contract" with "empty calldata". 
        
            2- on plain Ether transfers 
                e.g. via 
                    .send() 
                    .transfer()
        
                on a plain Ether transfer:

                    * if "receive function" dosn't exists, but a "payable fallback function" exists, 
                        the "fallback function" will be called. 
        
                    * If neither a "receive" Ether nor a "payable fallback" function is present, 
                        the contract cannot receive Ether through a transaction that does not represent a "payable function call" 
                        and throws an "exception".


        In the "worst case", the receive function can only rely on "2300 gas" being available 
            (for example when send or transfer is used)
            leaving little room to "perform other operations" except "basic logging". 

        The following operations will consume "more gas than the 2300 gas" stipend:
            - Writing to storage
            - Creating a contract
            - Calling an "external function" which consumes a large amount of gas
            - Sending Ether


        Warning:

            When "Ether" is sent directly to a contract, without a "function call"
                i.e. sender uses "send" or "transfer"
                but the receiving contract does not define a "receive" Ether function or a payable "fallback" function, 
                    - an "exception" will be thrown, 
                    - "sending back" the Ether (this was different before Solidity v0.4.0)

            If you want your contract to receive Ether
                you have to implement a "receive" Ether function
            
            payable "fallback" functions is not recommended for receiving Ether
                since the "fallback" is "invoked" and would not fail for "interface confusions" on the part of the sender.


        Warning:

            A contract without a "receive" Ether function can receive Ether 
                as a recipient of a "coinbase transaction" (miner block reward) 
                or as a destination of a "selfdestruct"

                A contract cannot react to such Ether transfers and thus also cannot reject them. This is a design choice of the EVM and Solidity cannot work around it.

It also means that address(this).balance can be higher than the sum of some manual accounting implemented in a contract (i.e. having a counter updated in the receive Ether function).    
*/