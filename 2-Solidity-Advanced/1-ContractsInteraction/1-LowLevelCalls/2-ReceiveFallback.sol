/**
    Special Functions

        https://docs.soliditylang.org/en/v0.8.18/contracts.html#special-functions


        
    How to send Ether?

        -------------------------------------------
        You can send Ether to other contracts by
        -------------------------------------------
        METHOD      GAS COST            IF FAIL
        -------------------------------------------
        transfer    2300 gas            throws error
        send        2300 gas            returns bool
        call        forward all gas     returns bool
        -------------------------------------------
            * gas limit for call is adjustable *
        -------------------------------------------



    How to receive Ether?

        A contract receiving Ether must have at least one of the functions below

        -----------------------------------------------------------
        METHOD                              WHEN CALL
        -----------------------------------------------------------
        receive() external payable          if msg.data is empty
        fallback() external payable         otherwise
        -----------------------------------------------------------


        "receive"
            Ether transfers
            empty calldata

        "fallback" function
            interface confusions (none of the other functions match the function identifier)
            non-empty calldata (even if Ether is sent along with the call)



    Which function is called, fallback() or receive()?


                         send Ether
                             |
                    msg.data is empty?
                            / \
                           /   \
                        yes     no
                        /         \
            receive() exists?   fallback()
                     /   \
                    yes   no
                 /         \
            receive()    fallback()
            
*/



/**
    Receive

        A contract can have at most one receive function, without the function keyword, declared using :

            receive() external payable { ... }  

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
            (for example when "send" or "transfer" functions is used)
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

                A contract cannot react to such Ether transfers and thus also cannot reject them. 
                    This is a design choice of the EVM and Solidity cannot work around it.

                It also means that address(this).balance can be higher than the sum of some manual accounting implemented in a contract 
                    i.e. having a counter updated in the receive Ether function.
*/



/// Below you can see an example of a Sink contract that uses function receive.
/// This contract keeps all Ether sent to it with no way to get it back.

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Sink {

    event Received(address, uint);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}



/**
    Fallback

        A contract can have at most one "fallback function", without the "function keyword", declared using : 

            fallback () external [payable] 
            fallback (bytes calldata input) external [payable] returns (bytes memory output) 
        
        
        fallback function:
            - must have "external" visibility
            - can be "virtual"
            - can "override" 
            - can have "modifiers"
            - always receives data
            - must be marked payable (in order to also receive Ether)


        
        fallback is executed when:
            - 'non-exixting' function is called
            - Ether is sent directly to a contract but 'does not exist receive function' or 'msg.data is not empty'


        fallback has a '2300 gas limit' when called by 'transfer' or 'send'


        send / transfer      forwards 2300 gas to this fallback function
        call                 forwards all of the gas (adhustable)


        The "fallback" function is executed on a call to the contract :
            - if none of the other functions match the given "function signature"
            - if "no data" was supplied at all and there is "no receive Ether function"


        If the version with parameters is used, input will contain the "full data sent to the contract" - equal to "msg.data"
            and can return data in output.
        
        The returned data will not be ABI-encoded. 
            Instead it will be returned without modifications (not even padding).


        In the worst case, if a payable fallback function is also used in place of a receive function, 
            it can only rely on 2300 gas being available (see receive Ether function).
            Like any function, the fallback function can execute complex operations as long as there is enough gas passed on to it.



        Warning:

            A payable fallback function is also executed for "plain Ether transfers", 
                if no receive Ether function is present. 
                
            It is recommended to always 
                define a "receive" Ether function as well, 
                if you define a payable fallback function to distinguish "Ether transfers" from "interface confusions".


        Note:
            If you want to "decode the input data",
                you can check the "first four bytes" for the "function selector" 
                and then you can use "abi.decode" together with the "array slice syntax" to "decode ABI-encoded data" : 

                    (c, d) = abi.decode(input[4:], (uint256, uint256)); 

                Note that this should only be used as a last resort and proper functions should be used instead.
*/





pragma solidity >=0.6.2 <0.9.0;

contract Test {

    uint x;

    // This function is called for all messages sent to this contract (there is no other function).
    // Sending Ether to this contract will cause an exception, 
    //    because the fallback function does not have the `payable` modifier.
    
    fallback() external { 
        x = 1; 
    }
}





contract TestPayable {

    uint x;
    uint y;


    //    This function is called for all messages sent to this contract, except plain Ether transfers 
    //        because there is no other function except the receive function.

    //    Any "call" with "non-empty calldata" to this contract will execute the fallback function
    //        even if Ether is sent along with the call.
    
    fallback() external payable {
         x = 1; 
         y = msg.value; 
    }



    //    This function is called for plain Ether transfers, 
    //        i.e. for every call with "empty calldata".

    receive() external payable { 
        x = 2; 
        y = msg.value; 
    }
}



contract Caller {


    function callTest(Test test) public returns (bool) {

        // fallback function will be executed
        // and results in (test.x = 1)
        (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        

        // address(test) will not allow to call 'send' directly, 
        //    since 'test' has no payable fallback function
        // It has to be converted to the 'address payable' type to even allow calling 'send' on it
        address payable testPayable = payable(address(test));


        // There is no receive function in Test contract
        // If someone sends Ether to that contract, the transfer will fail
        //    i.e. this returns false here.
        return testPayable.send(2 ether);
    }



    function callTestPayable(TestPayable test) public returns (bool) {

        // fallback function will be executed
        // results in (test.x= 1) and (test.y = 0)
        (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        

        // fallback function will be executed
        // results in (test.x = 1) and (test.y = 1)
        (success,) = address(test).call{value: 1}(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        

        // "receive" function will be called.
        // Since that function writes to storage, it takes more gas than is available with a simple `send` or `transfer`.
        // Because of that, we have to use a "low-level call"
        // results in (test.x = 2) and (test.y = 2 ether)
        (success,) = address(test).call{value: 2 ether}("");
        require(success);
        

        return true;
    }

}







/**

    Best Practice
        https://consensys.github.io/smart-contract-best-practices/development-recommendations/solidity-specific/fallback-functions/

    Keep fallback functions simple

        Fallback functions are called when a contract is sent a message with no arguments or when no function matches,
         and only has access to 2,300 gas when called from a .send() or .transfer(). 
         
        If you wish to be able to receive Ether from a .send() or .transfer(), 
            the most you can do in a fallback function is log an event. 
            Use a proper function if a computation of more gas is required.



        /////////////////    bad    /////////////////

        fallback() external payable { 
            balances[msg.sender] += msg.value; 
        }




        /////////////////    good    /////////////////

        function deposit() payable external { 
            balances[msg.sender] += msg.value; 
        }


        fallback() external payable { 
            require(msg.data.length == 0); 
            emit LogDepositReceived(msg.sender); 
        }


        NOTE: Check data length in fallback functions


        fallback functions is called for

            1. plain ether transfers (without data) 
            2. when no other function matches

            so you should check that the data is empty 
                if the fallback function is intended to be used only for the purpose of "logging received Ether".
                Otherwise, callers will not notice if your contract is used incorrectly and functions that do not exist are called.



        /////////////////    bad    /////////////////

        fallback() external payable { 
            emit LogDepositReceived(msg.sender); 
        }



        /////////////////    good    /////////////////

        fallback() external payable { 
            require(msg.data.length == 0); 
            emit LogDepositReceived(msg.sender); 
        }




    Which method should you use?

        'call' in combination with 're-entrancy guard' is the recommended method to use after December 2019.


    Guard against re-entrancy by:
        1. making all 'state changes' before 'calling other contracts'(External Calls)
        2. using 're-entrancy' guard modifier (OpenZeppelin)

*/