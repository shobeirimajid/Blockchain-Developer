
/**
    Enums
    https://docs.soliditylang.org/en/v0.8.18/types.html#enums

        Enums are one way to create a "user-defined" type in Solidity. 

        They are "explicitly convertible" to and from all "integer types" but "implicit conversion" is not allowed. 
        
        The "explicit conversion" from integer checks at "runtime" that the value lies inside the range of the enum and causes a Panic error otherwise. 
        
        Enums require at least one member, and its default value when declared is the first member. 
        
        Enums cannot have more than 256 members.

        The data representation is the same as for enums in C: 
            The options are represented by subsequent unsigned integer values starting from 0.

        you can get the smallest and respectively largest value of the given enum using:
            type(NameOfEnum).min 
            type(NameOfEnum).max 

        Note:
            Enums can be declared 
                - inside the contract/library
                - outside the contract/library (on the file level)
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }

    // Since enum types are not part of the ABI, the signature of "getChoice"
    // will automatically be changed to "getChoice() returns (uint8)" for all matters external to Solidity.
    function getChoice() public view returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }

    function getLargestValue() public pure returns (ActionChoices) {
        return type(ActionChoices).max;
    }

    function getSmallestValue() public pure returns (ActionChoices) {
        return type(ActionChoices).min;
    }
}



/**
    User Defined Value Types

        https://docs.soliditylang.org/en/v0.8.18/types.html#user-defined-value-types

        A "user defined" value type allows creating a "zero cost abstraction" over an "elementary value type". 
        
        This is similar to an alias, but with "stricter type" requirements.

        A "user defined value type" is defined using 
                type C is V
            "C" is the name of the newly introduced type 
            "V" has to be a built-in value type (the “underlying type”). 

        The function "C.wrap" is used to convert from the "underlying type" to the "custom type". 
        
        Similarly, the function "C.unwrap" is used to convert from the "custom type" to the "underlying type".

        The type C does not have any operators or attached member functions. 
        
        In particular, even the operator == is not defined. 
        
        Explicit and implicit conversions to and from other types are disallowed.

        "data-representation" of values of "user defined types" are inherited from the "underlying type" 
        "data-representation" of values of "underlying type" is also inherited from used in the ABI.
*/



/**
    The following example illustrates a custom type "UFixed256x18" representing a "decimal fixed point type" 
    with 18 decimals 
    and a minimal library to do arithmetic operations on the type.
*/


// Represent a 18 decimal, 256 bit wide fixed point type using a user defined value type.
type UFixed256x18 is uint256;

/// A minimal library to do fixed point operations on UFixed256x18.
library FixedMath {
    uint constant multiplier = 10**18;

    /// Adds two UFixed256x18 numbers. Reverts on overflow, relying on checked
    /// arithmetic on uint256.
    function add(UFixed256x18 a, UFixed256x18 b) internal pure returns (UFixed256x18) {
        return UFixed256x18.wrap(UFixed256x18.unwrap(a) + UFixed256x18.unwrap(b));
    }
    /// Multiplies UFixed256x18 and uint256. Reverts on overflow, relying on checked
    /// arithmetic on uint256.
    function mul(UFixed256x18 a, uint256 b) internal pure returns (UFixed256x18) {
        return UFixed256x18.wrap(UFixed256x18.unwrap(a) * b);
    }
    /// Take the floor of a UFixed256x18 number.
    /// @return the largest integer that does not exceed `a`.
    function floor(UFixed256x18 a) internal pure returns (uint256) {
        return UFixed256x18.unwrap(a) / multiplier;
    }
    /// Turns a uint256 into a UFixed256x18 of the same value.
    /// Reverts if the integer is too large.
    function toUFixed256x18(uint256 a) internal pure returns (UFixed256x18) {
        return UFixed256x18.wrap(a * multiplier);
    }
}


/**
    Notice how "UFixed256x18.wrap" and "FixedMath.toUFixed256x18" have the same signature but perform two very different operations: 
    
        UFixed256x18.wrap function returns a UFixed256x18 that has the same data representation as the input
        
        toUFixed256x18 returns a UFixed256x18 that has the same numerical value.
*/