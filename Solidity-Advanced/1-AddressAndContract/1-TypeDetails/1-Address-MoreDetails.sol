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

            
            Note:
                Prior to version 0.5.0, Solidity allowed address members to be accessed by a contract instance, 
                    Ex: this.balance
                "this.balance" is now forbidden.
                
            Note:
                All contracts can be converted to address type.
                so it is possible to query the balance of the current contract using explicit conversion of "this" to "address" type
                    Ex: address(this).balance



        low-level calls:
            .send()
            .transfer()
            .call()
            .delegatecall()
            .staticcall()

            Features:
                - operate on "addresses" rather than "contract instances"
                - do not check the contract existence (by extcodesize opcode) 
                - are cheaper in terms of gas
                - are less safe



        2- <address payable>.transfer(uint256 amount)

            - send given amount of Ether (in units of wei) to a payable address
            - reverts on failure
            - forwards "2300 gas" stipend, "not adjustable"


            Ex for transfer:
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

            - send given amount of Ether (in units of wei) to a payable address
            - returns false on failure
            - forwards "2300 gas" stipend, "not adjustable"


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

            <address>.call(bytes memory) returns (bool, bytes memory)

                - issue "low-level CALL" with the given payload 
                - returns success condition and return data 
                - forwards "all available gas", "adjustable"


            <address>.delegatecall(bytes memory) returns (bool, bytes memory)

                - issue "low-level DELEGATECALL" with the given payload 
                - returns success condition and return data
                - forwards "all available gas", "adjustable"


            <address>.staticcall(bytes memory) returns (bool, bytes memory)

                - issue "low-level STATICCALL" with the given payload 
                - returns success condition and return data 
                - forwards "all available gas", "adjustable"


            call, delegatecall, staticcall 
                - take a single "bytes memory" parameter 
                - return the "success condition" (as a bool) 
                - return the "returned data" (bytes memory). 

                - Note:
                    Prior to version 0.5.0,
                    these functions only returned the "success" condition and not the "return data".


            These functions are provided in order to:
                - interface with contracts that do not adhere (believe and follow) to the ABI
                - get more direct control over the encoding.

                - Warning:
                    These "very low-level" functions, Should be used with care and only as a last resort(choice)
                    Because:
                        1. Any "unknown contract" might be "malicious" 
                        and if you call it, you hand over control to that contract which could in turn "call back" into "your contract",
                        so be prepared for "changes to your state variables" when the call returns.
                        The "regular way" to interact with other contracts is to "call a function on a contract object" : x.f()

                        2. Also these "low-level" functions break the "type-safety" of Solidity.
                    

            Note:
                Previous versions of Solidity allowed these functions to receive "arbitrary arguments"
                 and would also handle a first argument "of type bytes4" differently. 
                These edge cases were removed in version 0.5.0.


            Note:
                The "gas" option is available on "all three methods" but It is best to avoid relying on "hardcoded gas" values in your smart contract code
                    regardless of whether state is read from or written to
                Because:
                    1. Setting gas in Contract Code, can have many pitfalls. 
                    2. Aaccess to gas might change in the future.



            * call:

                First example without structured data:
                    (bool success, bytes memory returnData) = address(nameReg).call("");
                    require(success);

                ABI functions can be used to encode structured data:
                    bytes memory payload = abi.encodeWithSignature("register(string)", "MyName");
                    address(nameReg).call(payload);

                    List of ABI Functions:
                    - abi.encode
                    - abi.encodePacked
                    - abi.encodeWithSelector
                    - abi.encodeWithSignature

                It is possible to "Adjust the Supplied Gas" with the "gas modifier":
                    address(nameReg).call{gas: 1000000}(payload);
                    
                It is possible to controll the supplied Ether value:
                    address(nameReg).call{value: 1 ether}(payload);

                These modifiers can be combined (Their order does not matter):
                    address(nameReg).call{gas: 1000000, value: 1 ether}(payload);

                
                Note:
                    The "value" option is only available on the "call".

            
                Warning:
                    You should avoid using .call() whenever possible when executing "another contract function" 
                    because it bypasses(dosn't consider) :
                        - type checking
                        - function existence check
                        - argument packing


                Warning:
                    Due to the fact that the EVM considers a "call" to a "non-existing contract" to always succeed,
                    Solidity includes an extra check using the "extcodesize opcode" when performing "External Calls". 
                    This ensures that:
                        "the contract that is about to be called either actually exists (it contains code) or an exception is raised".


            * delegatecall:

                The function "delegatecall" can be used in a similar way.

                The difference is that:
                    Only the code of the given address is used.
                    All other aspects (storage, balance, …) are taken from the current contract.

                The purpose of "delegatecall" is to use "library code" which is stored in another contract.

                The user has to ensure that the "layout of storage" in both contracts is suitable for delegatecall to be used.

                Note:
                    If state variables are accessed via a low-level delegatecall,
                    the storage layout of the two contracts must align in order for the called contract
                    to correctly access the storage variables of the calling contract by name. 
                    This is of course not the case if "storage pointers" are passed as "function arguments"
                    as in the case for the "high-level libraries".

                Note:
                    Prior to version 0.5.0, there was a  limited version of delegatecall called "callcode" 
                    "callcode" was removed in version 0.5.0.
                    "callcode" was similar but had slightly different semantics than "delegatecall"
                        - "callcode" did not provide access to the original "msg.sender" and "msg.value" values


            * staticcall

                After "byzantium" Hard Fork, "staticcall" can be used as well.

                "staticcall" is basically the same as "call",
                    but with difference that
                
                staticcall will "revert" if the "called function" modifies the "state" in any way.
            


        5. code, codehash

            * code

                <address>.code 

                You can query the "deployed code" for any "smart contract"
                Use .code to get the EVM bytecode -as a bytes memory- at the Address.
                EVM bytecode for a "smart contract", might be empty.


            * codehash

                <address>.codehash 

                You can query the hash of "deployed code" for any "smart contract"
                Use .codehash to get the Keccak-256 hash of EVM bytecode -as a bytes32

                Note:
                    that addr.codehash is cheaper than using keccak256(addr.code).
        
    */

    
}

