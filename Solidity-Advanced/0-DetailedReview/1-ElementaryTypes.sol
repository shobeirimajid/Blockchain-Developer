
/**
    Elementary Types

    https://docs.soliditylang.org/en/v0.8.18/types.html


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


    1. Booleans
    
        * possible values
            true
            false

        * Default Value
            false

        * Operators
            ! (logical negation)
            && (logical conjunction, “and”)
            || (logical disjunction, “or”)
            == (equality)
            != (inequality)

        * Conversion
            Note that there is no type conversion from "non-boolean" to "boolean" types 
                as there is in C and JavaScript.
            so 
                if (1) { ... } 
            is not valid Solidity!

        Parentheses can not be omitted for conditionals
        curly braces can be omitted around single-statement bodies.



    2. Integers - by size 8, 16, 32, 64, 128, 256

        int / uint - Signed and UnSigned integers

        * possible values
            [0 .. 2**n-1]

        * Default Value
            0

        int ~ int256
        uint ~ uint256


        * Operators

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

        
        For an integer type X, you can use 
            type(X).min : to access the minimum value representable by the type.
            type(X).max : to access the maximum value representable by the type.



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



    4. Fixed-size "byte arrays"

        hold a sequence of bytes from 1 to up to 32.

        bytes1
        bytes2
        bytes3
        ,…,
        bytes32

        * Operators
            Comparisons (evaluate to bool)
                <=, <
                >=, > 
                ==
                !=
                
            Bit operators
                &, |
                ^ (bitwise exclusive or)
                ~ (bitwise negation)

            Shift operators
                << (left shift)
                >> (right shift)

                Note:
                    1- Shifting operators work with "unsigned integer type" as "right operand" 
                        which denotes the "number of bits" to shift by.

                    2- Shifting by a signed type will produce a compilation error.

                    3- Shifting operators return the type of the left operand

            Index access: 
                If x is of type bytesI, then 
                x[k] for 0 <= k < I 
                    returns the k th byte (read-only).
            
            Members:
                .length 
                    yields the fixed length of the byte array (read-only).
            
            Note:
                The type bytes1[] is an array of bytes, but due to padding rules, it wastes 31 bytes of space for each element (except in storage). 
                It is better to use the bytes type instead.
                Prior to (before) version 0.8.0, byte used to be an alias for bytes1.


            
    5. Fixed-size byte arrays           

        bytes:
            Dynamically-sized "byte array", 
                Not a "value-type"!
                see Arrays in "ReferenceTypes"
                    https://docs.soliditylang.org/en/v0.8.18/types.html#arrays
            

        string:
            Dynamically-sized "UTF-8-encoded string", 
                Not a value-type!
                see Arrays in "ReferenceTypes"
                    https://docs.soliditylang.org/en/v0.8.18/types.html#arrays 



    6. Address Literals

        "Hexadecimal literals" that pass the "address checksum test", 
            for example 0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF are of "address type".

        "Hexadecimal literals" that are between 39 and 41 digits long and do "not pass" the "checksum test" produce an "error".
            You can prepend (for integer types) or append (for bytesNN types) zeros to remove the error.

        Note:
            The mixed-case "address checksum format" is defined in "EIP-55".
            https://github.com/ethereum/EIPs/blob/master/EIPS/eip-55.md
            convert the address to hex :
                if the ith digit is a letter (ie. it's one of abcdef) 
                    if the 4*ith bit of the hash of the lowercase hexadecimal address is 1
                        print it in "uppercase" 
                    otherwise 
                        print it in "lowercase"



    7. Rational and Integer Literals

        "Integer literals" 
            are formed from a "sequence of digits" in the range 0-9. 
            They are interpreted as decimals. 
            For example, 69 means sixty nine. 

        "Octal literals" 
            do not exist in Solidity
            leading zeros are invalid.

        "Decimal fractional literals"
            are formed by a . with at least one number after the decimal point. 
            Examples include .1 and 1.3 (but not 1.)

        "Scientific notation" in the form of 2e10 is also supported,
         where the mantissa can be fractional but the exponent has to be an integer.
         MeE = M * 10**E 
         Ex:
            2e18    =   2   * 10 ** 18
            -2e18   =   -2  * 10 ** 18
            2e-18   =   2   * 10 ** -18
            2.5e18  =   2.5 * 10 ** 18

        Underscores (_) can be used to separate the digits of a "numeric literal" to aid "readability". 
        There is no additional semantic meaning added to a number literal containing underscores, the underscores are ignored.
        Underscores are only allowed "between two digits" and only "one consecutive" underscore is allowed.
        Ex:
            decimal                         123_000, 
            hexadecimal                     0x2eff_abde
            scientific decimal notation     1_2e345_678

        "Number literal expressions" retain arbitrary precision until they are converted to a non-literal type 
            (i.e. by using them together with anything other than a number literal expression (like boolean literals) or by explicit conversion). 
            This means that computations do not overflow and divisions do not truncate in "number literal expressions".

        For example:
            (2**800 + 1) - 2**800 results in the constant 1 (of type uint8) 
                although intermediate results would not even fit the "machine word size". 
            Furthermore
            .5 * 8 results in the integer 4
                although "non-integers" were used in between.


        Warning:

            While most operators produce a literal expression when applied to literals, 
                there are certain operators that do not follow this pattern:
                    1. Ternary operator (... ? ... : ...),
                    2. Array subscript (<array>[<index>]).

            You might expect following expressions to be equivalent to using the literal 256 directly
                255 + (true ? 1 : 0) or 255 + [1, 2, 3][0]
                but in fact they are computed within the type uint8 and can overflow.

        * Operators

            Any operator that can be applied to "integers" can also be applied to "number literal expressions" as long as the "operands are integers". 

                If any of the two is "fractional", bit operations are "disallowed" 
                if the exponent is fractional "exponentiation" is "disallowed"  (because that might result in a non-rational number).

            "Shifts" and "exponentiation" with literal numbers as left (or base) operand and integer types as the right (exponent) operand
             are always performed in the uint256 (for non-negative literals) or int256 (for a negative literals) type,
              regardless of the type of the right (exponent) operand.
         
        Warning:
            Division on "integer literals" used to truncate in Solidity prior to version 0.4.0, 
            but it now converts into a rational number
            Ex:
                5 / 2 is not equal to 2
                5 / 2 = 2.5

        Note:
            Solidity has a number literal type for each rational number. 
            Integer literals and rational number literals belong to number literal types. 
            Moreover, all number literal expressions
                    i.e. the expressions that contain only number literals and operators...
                belong to number literal types. 
            So the number literal expressions 1 + 2 and 2 + 1 both belong to the same number literal type for the rational number three.

        Note:
            Number literal expressions are converted into a non-literal type as soon as they are used with non-literal expressions. 
            Disregarding types, the value of the expression assigned to b below evaluates to an integer. 

            Because "a" is of type "uint128", the expression "2.5 + a" has to have a proper type, though. 

            Since there is no "common type" for the type of "2.5" and "uint128", 
                the Solidity compiler does not accept this code.

            uint128 a = 1;
            uint128 b = 2.5 + a + 0.5;

        

    8. String Literals and Types

        "String literals" are written with either double or single-quotes
            "foo" ~ 'bar'

        and they can also be split into multiple consecutive parts which can be helpful when dealing with long strings.
            "foo" "bar" ~ "foobar"
    
        They do not imply trailing zeroes as in C
            "foo" represents three bytes, not four. 

        As with "integer literals", their type can vary, 
            but they are implicitly convertible to 
                bytes1, …, bytes32, 
            if they fit, to bytes and to string.
        
        For example:
            bytes32 samevar = "stringliteral" 
            string literal is interpreted in its "raw byte" form when assigned to a "bytes32 type".

        "String literals" can only contain "printable ASCII characters", 
        which means the characters between and including 
            0x20 .. 0x7E

        "String literals" support the following "escape characters":

            \<newline> (escapes an actual newline)

            \\ (backslash)

            \' (single quote)

            \" (double quote)

            \n (newline)

            \r (carriage return)

            \t (tab)

            \xNN (hex escape)
                 takes a hex value and inserts the appropriate byte

            \uNNNN (unicode escape)
                takes a Unicode codepoint and inserts an UTF-8 sequence

        Note:
            Until version 0.8.0 there were three additional escape sequences: 
                \b
                \f 
                \v
            They are commonly available in other languages but rarely needed in practice. 
            If you do need them, they can still be inserted via hexadecimal escapes 
                respectively, just as any other ASCII character:
                \x08
                \x0c 
                \x0b
                
        
        The string in the following example has a length of ten bytes. 

            "\n\"\'\\abc\
            def"

            It starts with a "newline byte"                                 \n
            followed by a "double quote"                                    \"
            a "single quote"                                                '\
            a "backslash character"                                         \\
            and then (without separator) the character sequence "abcdef"    abc\
                                                                            def
     

            Any Unicode line terminator which is not a newline 
                LF, VF, FF, CR, NEL, LS, PS is considered to terminate the string literal. 

            * "Newline" only terminates the "string literal" if it is "not preceded" by a "\"



    9. Unicode Literals (prefixed with the keyword unicode)

        "String literals" can only contain "ASCII" 
        "Unicode literals" can contain "any valid UTF-8 sequence". 

        They also support the very same "escape sequences" as regular "string literals".

        string memory a = unicode"Hello 😃";



    10. Hexadecimal Literals

        "Hexadecimal literals" are prefixed with the keyword "hex" and are enclosed in double or single-quotes 
            hex"001122FF"
            hex'0011_22_FF'

        Their content must be "hexadecimal digits" which can optionally use a "single underscore" as separator between byte boundaries. 
        
        The value of the literal will be the "binary representation" of the "hexadecimal sequence".

        Multiple "hexadecimal literals" separated by "whitespace" are concatenated into a "single literal": 
            hex"00112233" hex"44556677" ~ hex"0011223344556677"

        Hexadecimal literals behave like string literals and have the same convertibility restrictions.


    Operators
    https://docs.soliditylang.org/en/v0.8.18/types.html#operators

    Conversions between Elementary Types
    https://docs.soliditylang.org/en/v0.8.18/types.html#conversions-between-elementary-types

    onversions between Literals and Elementary Types
    https://docs.soliditylang.org/en/v0.8.18/types.html#conversions-between-literals-and-elementary-types
*/