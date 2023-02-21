
/**
    Function Calls
        https://docs.soliditylang.org/en/v0.8.18/control-structures.html#function-calls
*/



/**
    -----------------------------------------
    Internal Function Calls
    -----------------------------------------

    Functions of the current contract can be called directly (“internally”), also recursively, as seen in this nonsensical example:
*/



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

// This will report a warning
contract C {

    function g(uint a) public pure returns (uint ret) {
         return a + f(); 
    }

    function f() internal pure returns (uint ret) { 
        return g(7) + f(); 
    }
}



/**
    Internal "function calls" are translated into "simple jumps" inside the EVM.

    This has the effect that the "current memory" is not cleared, 
        i.e. passing "memory references" to "internally-called functions" is "very efficient" 

    Only functions of the "same contract instance" can be called "internally"

    You should still "avoid excessive recursion"!
        because every "internal function call" uses up at least "one stack slot" 
            and there are only 1024 slots available.


    -----------------------------------------
    Function Calls with "Named Parameters"
    -----------------------------------------
    Function call "arguments" can be given by "name", "in any order", 
        if they are enclosed in { } as can be seen in the following example. 
        The "argument list" has to coincide by name with the "list of parameters" from the "function declaration", 
            but can be in arbitrary order. 
*/



pragma solidity >=0.4.0 <0.9.0;

contract DataSet {

    mapping(uint => uint) data;

    function f() public {
        set({value: 2, key: 3});
    }

    function set(uint key, uint value) public {
        data[key] = value;
    }
}



/**
    -----------------------------------------
    "Omitted Names" in Function Definitions
    -----------------------------------------
    The "names of parameters" and "return values" in the "function declaration" can be omitted.

    Those items with omitted names will still be present on the stack, 
        but they are inaccessible by name. 

    An "omitted return value" name can still "return a value" to the "caller" by use of the "return" statement.
*/


pragma solidity >=0.4.22 <0.9.0;

contract OmittedNames {

    // omitted name for parameter
    function func(uint k, uint) public pure returns(uint) {
        return k;
    }
}






/**
    -----------------------------------------
    External Function Calls
    -----------------------------------------

        Functions can also be called using the :

            - this.g(8);
            - c.g(2);

        where c is a contract instance and g is a function belonging to c. 
        Calling the function g via either way results in it being called “externally”, 
            using a "message call" and not "directly via jumps". 
        
        Please note that "function calls" on "this" cannot be used in the "constructor"!
            because the actual contract has not been created yet.  

        "Functions of other contracts" have to be called "externally". 
            For an "external call", all "function arguments" have to be copied to "memory".

        ******************************************* important Note *******************************************
         
            A "function call" from "one contract" to "another contract" does not create its own "transaction", 
                it is a "message call" as "part of the overall transaction".

        ******************************************* important Note *******************************************

        When calling "functions of other contracts", 
            you can specify the "amount of Wei/gas" sent with the call 
            with the special options :

                {value: 10, gas: 10000}

        Note that it is "not recommended" to specify "gas values" explicitly, 
            since the "gas costs" of "opcodes" can change in the future. 
        
        Any "Wei you send to the contract" is added to the "total balance of that contract":
*/


pragma solidity >=0.6.2 <0.9.0;

contract InfoFeed {

    function info() public payable returns (uint ret) { 
        return 42; 
    }
}



contract Consumer {

    InfoFeed feed;

    function setFeed(InfoFeed addr) public { 
        feed = addr; 
    }

    function callFeed() public { 
        feed.info{value: 10, gas: 800}(); 
    }
}


/**
    You need to use the modifier "payable" with the "info function" 
        because otherwise, the "value" option would not be available.


    Warning:

        Be careful that 
            feed.info{value: 10, gas: 800} 
        only locally sets the value and amount of gas sent with the function call,
        and the parentheses at the end perform the actual call. 

        So 
            feed.info{value: 10, gas: 800} 
        does not call the function and the value and gas settings are lost!

        only 
            feed.info{value: 10, gas: 800}() 
        performs the function call.



    ******************************************* important Note *******************************************

    [ extcodesize ]

    Due to the fact that the "EVM" considers a "call to a non-existing contract" to always "succeed", 
    Solidity uses the "extcodesize" opcode 
    
    "extcodesize" opcode "check" that the "contrac"t that is about to be called "actually exists" (it contains code) 
        and causes an "exception" if it does not exists (code is empty). 
        
    This check is skipped if the "return data" will be "decoded after the call"
        thus the "ABI decoder" will "catch" the case of a "non-existing contract".

    Note that this check is not performed in case of "low-level calls" which operate on "addresses" rather than "contract instances".

    ******************************************* important Note *******************************************


    Note:
        Be careful when using "high-level calls" to "precompiled contracts"
        since the compiler considers them "non-existing" according to the above logic 
            even though they "execute code" and "can return data".

    "Function calls" also cause "exceptions" 
        if the "called contract" itself throws an "exception" or goes "out of gas"


    Warning:

        Any "interaction with another contract" imposes a "potential danger", 
            especially if the "source code" of the contract is "not known in advance". 

        The "current contract" hands over "control" to the "called contract" 
            and that may potentially do just about anything. 

        Even if the "called contract" inherits from a "known parent contract", 
            the "inheriting contract" is only required to have a correct interface.

        The implementation of the contract, however, can be completely arbitrary 
            and thus, pose a danger. 
            
        In addition, be prepared in case it "calls into other contracts" of your system 
            or even "back into the calling contract" before the "first call returns". 
            This means that the "called contract" can "change state" variables of the "calling contract" via its functions. 
            
        Write your functions in a way that, for example, 
            calls to "external functions" happen "after any changes to state" variables in your contract 
                so your contract is not vulnerable to a "reentrancy" exploit.

    Note:
        Before Solidity 0.6.2, 
        the recommended way to specify the value and gas was to use :

            f.value(x).gas(g)()

        This was deprecated in Solidity 0.6.2 
        and is no longer possible since Solidity 0.7.0.
*/


