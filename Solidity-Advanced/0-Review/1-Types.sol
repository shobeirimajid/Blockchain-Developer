// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SolidityTypes {

    /// https://docs.soliditylang.org/en/v0.8.18/types.html

    /**
     Elementary Types

     Solidity is a "statically typed" language,
      which means that the type of each variable (state and local) needs to be specified.
     The concept of “undefined” or “null” values does not exist in Solidity,
      but newly declared variables always have a "default value" dependent on its type. 
     To handle any "unexpected values", you should use the "revert" function to revert the whole transaction,
      or return a "tuple" with a "second bool value" denoting "success".

     Solidity provides several elementary types which can be combined to form complex types.

     Value Types

        The following types are also called "value types" because
         variables of these types will always be passed by value,
         i.e. they are always copied when they are used as function arguments or in assignments.


        Booleans - possible values: true/false


        Integers - by size 8, 16, 32, 64, 128, 256

            int / uint - Signed and UnSigned integers
            Range : 0 up to 2**n - 1

            int ~ int256
            uint ~ uint256

            For an integer type X, you can use 
             type(X).min : to access the minimum value representable by the type.
             type(X).max : to access the maximum value representable by the type.

        Fixed Point Numbers

            Fixed point numbers are not fully supported by Solidity yet. 
            They can be declared, but cannot be assigned to or from.

            fixed / ufixed - igned and unsigned fixed point number of various sizes
            ufixedMxN / fixedMxN - 
                M : number of bits taken by the type - {8, 16, 32, 64, 128, 256}
                N : how many decimal points are available - [0-80]
            ufixed ~ ufixed128x18
            fixed ~ fixed128x18

            The main difference between "floating point" (float & double) and "fixed point" numbers is that:
                the number of bits used for the "integer part" and the "fractional part" (after decimal dot)
                    is flexible in the "floating point"  
                    is strictly defined in the "fixed point"
                Generally, in "floating point" almost the entire space is used to represent the number.

        Address

            The address type comes in two flavours, which are largely identical:
                address: Holds a 20 byte value - size of an Ethereum address
                address payable: Same as address, but with the additional members "transfer" and "send"

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

            Note 1:
            If you need a variable of type "address" and plan to send Ether to it,
             then declare its type as "address payable" to make this requirement visible.
            Also, try to make this distinction or conversion as early as possible.
            
            Note 2:
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
            
            Members of Addresses:
                check the "Address-MoreDetails" file to see more details about address type.
    */




    /**
        Operators

        Types can interact with each other in expressions containing operators.

        * Operators on Booleans:

            ! (logical negation)
            && (logical conjunction, “and”)
            || (logical disjunction, “or”)
            == (equality)
            != (inequality)

        * Operators on Integers:

            Comparisons (evaluate to bool): 
                <=, <
                >=, > 
                ==
                !=
            
            Bit operators: 
                &, |
                ^ (bitwise exclusive or)
                ~ (bitwise negation)

            Shift operators: 
                << (left shift) ---  (x << y) ->  (x * 2**y)
                >> (right shift) ---  (x >> y) ->  (x / 2**y)

            Arithmetic operators: 
                +, -, *, /
                unary - (only for signed integers),
                % (modulo) --- a % n yields the remainder r
                ** (exponentiation) --- (x**3) -> (x*x*x)
                                        0**0 = 1 (by the EVM)

        * Operators on Fixed Point Numbers:
            Comparisons (evaluate to bool):
                <=, <, 
                >=, > 
                ==
                !=
            
            Arithmetic operators: 
                +, -, *, /
                unary -
                % (modulo)

        * Operators on Address:

            <=, <, 
            >=. >
            ==
            !=
            
    **/



    /**
     ReferenceTypes
    */



    /**
     Mapping Types
    */





    /**
     Default Value
        Booleans: false
        Integers: 0
    */

}