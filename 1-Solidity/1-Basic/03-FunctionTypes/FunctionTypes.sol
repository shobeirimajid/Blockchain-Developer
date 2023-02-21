
/**
    --------------------------
    Functions
    --------------------------

    https://docs.soliditylang.org/en/latest/contracts.html#functions

    Function types are the types of functions. 
    
    "Variables" of "function type" can be assigned from "functions" 
    "function parameters" of "function type" can be used to pass functions to and return functions from "function calls"
    
    "Function types" come in two flavours 
        1. internal functions
        2. external functions

    Internal functions 
        can only be called "inside" the "current contract" 
        more specifically, "inside" the "current code unit", 
            which also includes "internal library functions" and "inherited functions"
        because they cannot be executed "outside" of the "context" of the "current contract".

        "Calling an internal function" is realized by "jumping to its entry label", 
            just like when calling a function of the current contract internally.

    External functions
        consist of an "address" and a "function signature" 
            and they can be "passed via" and "returned" from "external function calls"


    Function types are notated as follows:

        function (<parameter types>) {internal|external} [pure|view|payable] [returns (<return types>)]


    In contrast to the "parameter types", the "return types" cannot be empty 
        - if the function type should not return anything, the whole part [returns (<return types>)] has to be omitted.

    
    By "default", function types are "internal", so the internal keyword can be omitted. 
        Note that this only applies to function types. 

    "Visibility" has to be specified explicitly for functions defined in contracts, they do not have a "default".


    Conversions:

        A "function type A" is implicitly convertible to a "function type B" if and only if 
            their parameter types are identical
            their return types are identical
            their internal/external property is identical 
            and the state mutability of A is more restrictive than the state mutability of B
            
        In particular:
            "pure"          convertable to          view , non-payable
            "view"          convertable to          non-payable
            "payable"       convertable to          non-payable

        No other conversions between function types are possible.

        The rule about "payable" and "non-payable" might be a little confusing, but in essence:

            * "payable" function is "not rejecting ether" and also accepts a payment of "zero Ether", so it also is "non-payable" 
            * "non-payable" function is "rejecting ether" and will reject Ether sent to it. so it not convertable to "payable" 

        
        =>      "payable"                       convertable to              "non-payable"
                "not rejecting ether"                                       "rejecting ether"

        you can override a "payable function" with a "non-payable" but not the other way around.

        Additionally, When you define a "non-payable" function pointer, 
            the compiler "does not enforce" that the pointed function will actually "reject ether"
            Instead, it "enforces" that the function pointer is "never used to send ether"

            Which makes it possible to assign a "payable" function pointer to a "non-payable" function pointer 
            ensuring both types behave the same way, 
                i.e, both cannot be used to send ether.

        If a "function type variable" is "not initialised", calling it results in a "Panic error"

            https://docs.soliditylang.org/en/v0.8.18/control-structures.html#assert-and-require

        The same happens if you call a function after using "delete" on it.


        If external function types are used outside of the context of Solidity,
         they are treated as the function type, which encodes the address followed by the function identifier together in a single bytes24 type.

        Note that public functions of the current contract can be used both as an internal and as an external function. 
            To use f as an internal function, just use f
            if you want to use its external form, use this.f


        A function of an "Internal type" can be assigned to a variable of an "internal function type" regardless of where it is defined.
            This includes "private", "internal" and "public" functions of both contracts and libraries as well as free functions.

        A function of an "External type" are only compatible with "public" and "external" contract functions.

    
        Note:

        External functions with "calldata parameters" are incompatible with "external function types" with calldata parameters. 

        They are compatible with the corresponding types with "memory parameters" instead. 
        
        For example

            there is no function that can be pointed at by a value of type [ function (string calldata) external ]

            while [ function (string memory) external ] can point at both :

                [ function f(string memory) external {} ] 
                and 
                [ function g(string calldata) external {} ] 

             This is because for both locations the "arguments" are passed to the function in the "same way"
             
        The "caller" cannot pass its "calldata directly" to an "external function" and always ABI-encodes the arguments into memory. 
            
        Marking the parameters as "calldata" only affects the implementation of the "external function" 
            and is meaningless in a function pointer on the caller’s side.

        "Libraries" are excluded because they require a "delegatecall" and use a different ABI convention for their selectors. 
        
        Functions declared in "interfaces" do not have "definitions"
         so pointing at them does not make sense either.



    Members:  

        External (or public) functions have the following members:

            .address 
                returns the address of the contract of the function

            .selector
                returns the ABI function selector

        Note:
            External (or public) functions used to have the additional members

                .gas(uint) 
                .value(uint)

            These were deprecated in Solidity 0.6.2 and removed in Solidity 0.7.0. 
            
            Instead use :
             {gas: ...}     :   to specify the amount of gas sent to a function
             {value: ...}   :   to specify the amount of amount (of wei) sent to a function

            See "External Function Calls" for more information:
                https://docs.soliditylang.org/en/v0.8.18/control-structures.html#external-function-calls


    Note
    "Lambda functions" or "inline functions" are planned but not yet supported in Solidity.
*/





/// Example that shows how to use the members

// SPDX-License-Identifier: GPL-3.0
contract Example {

    function f() public payable returns (bytes4) {
        assert(this.f.address == address(this));
        return this.f.selector;
    }

    function g() public {
        this.f{gas: 10, value: 800}();
    }
}





/// Example that shows how to use internal function types:
library ArrayUtils {

    // "internal functions" can be used in "internal library functions"
    // because :
    // they will be part of the "same code context"

    function map(uint[] memory self, function (uint) pure returns (uint) f)
        internal
        pure
        returns (uint[] memory r)
    {

        r = new uint[](self.length);

        for (uint i = 0; i < self.length; i++) {
            r[i] = f(self[i]);
        }
    }

    function reduce(
        uint[] memory self,
        function (uint, uint) pure returns (uint) f
    )
        internal
        pure
        returns (uint r)
    {
        r = self[0];

        for (uint i = 1; i < self.length; i++) {
            r = f(r, self[i]);
        }
    }

    function range(uint length) internal pure returns (uint[] memory r) {
        r = new uint[](length);
        for (uint i = 0; i < r.length; i++) {
            r[i] = i;
        }
    }
}


contract Pyramid {

    using ArrayUtils for *;

    function pyramid(uint l) public pure returns (uint) {
        return ArrayUtils.range(l).map(square).reduce(sum);
    }

    function square(uint x) internal pure returns (uint) {
        return x * x;
    }

    function sum(uint x, uint y) internal pure returns (uint) {
        return x + y;
    }
}





/// Another example that uses external function types:


// SPDX-License-Identifier: GPL-3.0
contract Oracle {
    struct Request {
        bytes data;
        function(uint) external callback;
    }

    Request[] private requests;

    event NewRequest(uint);

    function query(bytes memory data, function(uint) external callback) public {
        requests.push(Request(data, callback));
        emit NewRequest(requests.length - 1);
    }

    function reply(uint requestID, uint response) public {
        // Here goes the check that the reply comes from a trusted source
        requests[requestID].callback(response);
    }
}


// SPDX-License-Identifier: GPL-3.0
contract OracleUser {

    Oracle constant private ORACLE_CONST = Oracle(address(0x00000000219ab540356cBB839Cbe05303d7705Fa)); // known contract
    uint private exchangeRate;

    function buySomething() public {
        ORACLE_CONST.query("USD", this.oracleResponse);
    }

    function oracleResponse(uint response) public {
        require(
            msg.sender == address(ORACLE_CONST),
            "Only oracle can call this."
        );
        exchangeRate = response;
    }
}