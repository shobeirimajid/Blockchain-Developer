// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract AddresseDetails {

    /// https://docs.soliditylang.org/en/v0.8.18/types.html#members-of-addresses

    /**

        Members of Addresses:

        For a quick reference of all members of address, see:
        https://docs.soliditylang.org/en/v0.8.18/units-and-global-variables.html#address-related



        1- <address>.balance

            a property of type uint256 that query the balance of an Address in units of Wei

            Ex:
                address payable x = payable(0x123);
                address myAddress = address(this);
                x.balance
                myAddress.balance
        


        2- <address payable>.transfer(uint256 amount)

            send given amount of Ether (in units of wei) to a payable address
            reverts on failure
            forwards "2300 gas" stipend, "not adjustable"

            Ex:
                address payable x = payable(0x123);
                address myAddress = address(this);
                if (x.balance < 10 && myAddress.balance >= 10) 
                    x.transfer(10);

            The transfer function fails and reverts if :
                - the balance of the current contract is not large enough
                - the Ether transfer is rejected by the receiving account.

            Note:
                If x is a contract address, its code 
                 (more specifically: its "Receive" Ether Function, if present, or otherwise its "Fallback" Function, if present) 
                will be executed together with the transfer call
                 (this is a feature of the EVM and cannot be prevented). 
                If that execution runs out of gas or fails in any way,
                 the Ether transfer will be "reverted" and the current contract will stop with an "exception".



        3- <address payable>.send(uint256 amount) returns (bool)

            send given amount of Ether (in units of wei) to a payable address
            returns false on failure
            forwards "2300 gas" stipend, "not adjustable"

            Note:
                Send is the "low-level" counterpart of the "transfer" function but
                 if the execution "fails", 
                  the current contract will "not stop with an exception", but send will "return false"

            Warning:
            There are some dangers in using "send" : 
                1- The transfer fails if the "call stack" depth is at 1024 (this can always be forced by the caller)
                2- The transfer fails if the recipient runs out of gas.
            So in order to make safe Ether transfers:
                1- Always check the "return value" of send
                2- Use ".transfer" function 
                3- or even better: Use a pattern where the recipient "withdraws" the money.


        4- .call, .delegatecall, .staticcall

            These functions are provided in order to:
                - interface with contracts that do not adhere (believe and follow) to the ABI
                - get more direct control over the encoding.

            They all 
                - take a single "bytes memory" parameter 
                - return the "success condition" (as a bool) 
                - return the "returned data" (bytes memory). 

            Following functions can be used to encode structured data :
                - abi.encode
                - abi.encodePacked
                - abi.encodeWithSelector
                - abi.encodeWithSignature



            <address>.call(bytes memory) returns (bool, bytes memory)
                issue "low-level CALL" with the given payload 
                returns success condition and return data 
                forwards "all available gas", "adjustable"

            <address>.delegatecall(bytes memory) returns (bool, bytes memory)
                issue "low-level DELEGATECALL" with the given payload 
                returns success condition and return data
                forwards "all available gas", "adjustable"

            <address>.staticcall(bytes memory) returns (bool, bytes memory)
                issue "low-level STATICCALL" with the given payload 
                returns success condition and return data 
                forwards "all available gas", "adjustable"

        


        <address>.code 
            code at the Address (bytes memory) (can be empty)

        <address>.codehash 
            the codehash of the Address (bytes32)
            



        Warning 1
            You should avoid using .call() whenever possible when executing "another contract function" 
             because it bypasses(dosn't consider) :
                - type checking
                - function existence check
                - argument packing


        Warning 3
            Due to the fact that the EVM considers a "call" to a "non-existing contract" to always succeed,
             Solidity includes an extra check using the "extcodesize opcode" when performing "External Calls". 
             This ensures that:
                "the contract that is about to be called either actually exists (it contains code) or an exception is raised".

            low-level calls :
                .call()
                .delegatecall()
                .staticcall()
                .send()
                .transfer()

                - operate on "addresses" rather than "contract instances"
                - do not check the contract existence (by extcodesize opcode) 
                - are cheaper in terms of gas
                - are less safe


        Note 1
            Prior to version 0.5.0, Solidity allowed address members to be accessed by a contract instance, 
            for example : this.balance

            This is now forbidden and an explicit conversion to address must be done.
            for example : address(this).balance


        Note 2
            If state variables are accessed via a low-level delegatecall,
             the storage layout of the two contracts must align in order for the called contract
             to correctly access the storage variables of the calling contract by name. 
            This is of course not the case if "storage pointers" are passed as "function arguments"
             as in the case for the "high-level libraries".

        Note 3
            Prior to version 0.5.0, following calls only returned the "success" condition and not the "return data".
                - .call
                - .delegatecall 
                - .staticcall 

        Note 4
            Prior to version 0.5.0, there was a member called "callcode" 
            with similar but slightly different semantics than "delegatecall"

        
        
    */

    
}

