// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ElementaryTypes {

    /// https://docs.soliditylang.org/en/v0.8.18/types.html

    /**
     Elementary Types

    Solidity is a "statically typed" language,
    which means that the type of each variable (state and local) needs to be specified.
    The concept of “undefined” or “null” values does not exist in Solidity,
    but newly declared variables always have a "default value" dependent on its type. 
    To handle any "unexpected values", you should use the "revert" function to revert the whole transaction,
    or return a "tuple" with a "second bool value" denoting "success".

    Solidity provides several "elementary types" which can be combined to form "complex types".

    "Elementary types" are also called "value types" because:
        - variables of these types will always be passed by value
        - they are always copied when they are used as function arguments or in assignments.


    1. Booleans - possible values: true/false

        * Operators:
            ! (logical negation)
            && (logical conjunction, “and”)
            || (logical disjunction, “or”)
            == (equality)
            != (inequality)


    2. Integers - by size 8, 16, 32, 64, 128, 256

        int / uint - Signed and UnSigned integers
        Range : 0 up to 2**n - 1

        int ~ int256
        uint ~ uint256

        For an integer type X, you can use 
            type(X).min : to access the minimum value representable by the type.
            type(X).max : to access the maximum value representable by the type.

        * Operators:

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


    3. Fixed Point Numbers

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

    4. 

    



    */




    /**
     Default Value
        Booleans: false
        Integers: 0
    */

}