  
/**
    AddresseTypes

    https://docs.soliditylang.org/en/v0.8.18/types.html#members-of-addresses

    The address type comes in two flavours, which are largely identical:
        "address": Holds a 20 byte value - size of an Ethereum address
        "address payable": Same as address, but with the additional members "transfer" and "send"

    address payable is an address you can send Ether to
        while you are not supposed to send Ether to a plain address, 
        because it might be a smart contract that was not built to accept Ether.

    Conversion (Type Casting):
        conversions from "address payable" to "address" : are allowed by Implicit conversion.
        conversions from "address" to "address payable" : payable(address)
        conversions to/from "address" are allowed for "uint160", "integer literals", "bytes20" , "contract" types.
        Only expressions of type "address" and "contract-type" can be converted to the type "address payable" via the explicit conversion payable(...). 
        For "contract-type", this conversion is only allowed if the contract can "receive" Ether,
        i.e., the contract either has a "receive function" or a "payable fallback function".  
        Note that payable(0) is valid and is an exception to this rule.

    Note:
        If you need a variable of type "address" and plan to send Ether to it,
        then declare its type as "address payable" to make this requirement visible.
        Also, try to make this distinction or conversion as early as possible.
    
    Note:
        The distinction between "address" and "address payable" was introduced with version "0.5.0". 
        Also starting from that version, "contracts" are not implicitly convertible to the "address" type,
        but can still be explicitly converted to "address" or to "address payable", if they have a "receive" or "payable fallback" function.

    Warning:
        If you convert a type that uses a "larger byte size(>20 byte)" to an "address", for example bytes32, then the address is truncated.
        To reduce conversion ambiguity, starting with version "0.4.24",
        the compiler will force you to make the truncation explicit in the conversion.
        for example:
        byte32 b = 0x111122223333444455556666'777788889999AAAA'BBBBCCCCDDDDEEEEFFFFCCCC;
        address(uint160(bytes20(b))) -> 0x111122223333444455556666777788889999aAaa
        address(uint160(uint256(b))) -> 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc
        note: each hex character takes 4 bits, so each byte can hold 2 hex chars.
                ethereum addresses is 20 byte and have 40 characters.



    Operators on Address types:
        <=, <, 
        >=. >
        ==
        !=



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

            .transfer()
            .send()

            .call()
            .delegatecall()
            .staticcall()

            Features:
                - operate on "addresses" rather than "contract instances"
                - do not check the contract existence (by extcodesize opcode) 
                - are cheaper in terms of gas
                - are less safe !!!




                call            Execute code of another contract

                delegatecall    Execute code of another contract, but with the state(storage) of the calling contract. 
                                When a third contract calls a delegate call to some function in callee on behalf of the caller 
                                and storage changes are made in the caller’s value and nothing is reflected in callee’s storage. 
                                This means that a contract can dynamically load code from a different address at runtime. 
                                Storage, current address, and balance still refer to the calling contract, 
                                only the code is taken from the called address.

                callcode        Deprecated

                staticcall      This is basically the same as a call, 
                                but will revert if the called function modifies the state in any way.




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
                    and failure handling is left to the calling contract.

            Warning:
                There are some dangers in using "send" : 
                    1- The transfer fails if the "call stack" depth is at 1024 (this can always be forced by the caller)
                    2- The transfer fails if the recipient runs out of gas.
                So in order to make safe Ether transfers:
                    1- Always check the "return value" of send
                    2- Use ".transfer" function 
                    3- or even better: Use a pattern where the recipient "withdraws" the money.




        Both "send" and "transfer" can be used for payments to EOAs or other smart contracts. 
        But since the amount of gas they forward to the called smart contract is very low, 
        the called smart contract can easily run out of gas. This would make the payment impossible.

        The problem here is that even if the receiving contract is designed carefully not to exceed the gas limit, 
        future changes in the gas costs for some opcodes can break this design.
        Therefore, the recommended way of sending payments is :  call()




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
                    see: https://docs.soliditylang.org/en/v0.8.18/internals/layout_in_storage.html

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

    Conversion:

        Every "hex literals" of the "correct size" that pass the "checksum test" are of "address type"
            No other literals can be implicitly converted to the address type.

        Explicit conversions to address are allowed only from "bytes20" and "uint160"

        An "address" a can be converted explicitly to "address payable" via :
            "payable(a)"

        Note:
            Prior to version 0.8.0, it was possible to 
                explicitly convert from any integer type (of any size, signed or unsigned) to address or address payable. 

            Starting with in 0.8.0 
                only conversion from "uint160" is allowed
*/