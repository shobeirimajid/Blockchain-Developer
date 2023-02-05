// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ContractTypes {}

/**
    ContractTypes
    
    https://docs.soliditylang.org/en/v0.8.18/types.html#contract-types

    Every "contract" defines its "own type". 
        You can implicitly convert "contracts" to contracts they "inherit" from. 
        "Contracts" can be explicitly converted to and from the "address type".

    Explicit conversion to and from the "address payable" type is only possible if the "contract" type has a "receive" or "payable fallback" function. 
        The conversion is still performed using address(x). 
        If the contract type does not have a receive or payable fallback function,
         the conversion to address payable can be done using payable(address(x)). 
         You can find more information in the section about the "address type".

        Note:
            Before version 0.5.0, contracts directly derived from the "address type" and there was no distinction between "address" and "address payable".

    If you declare a "local variable" of "contract type" (MyContract c), you can "call" functions on that contract. 
    Take care to assign it from somewhere that is the "same contract type".

    You can also instantiate contracts (which means they are newly created). 
    You can find more details in the ‘Contracts via new’ section.

    The "data representation" of a contract is identical to that of the address type and this type is also used in the ABI.

    Contracts do not support any "operators".

    The "members" of contract types are :
        1. external functions
        2. public state variables

    To access type information about the contract C:
        type(C)
*/
    

