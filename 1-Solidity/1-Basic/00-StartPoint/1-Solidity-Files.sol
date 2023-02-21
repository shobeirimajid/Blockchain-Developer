/*
    -----------------------------------
    Solidity Source File
    -----------------------------------
    https://docs.soliditylang.org/en/latest/layout-of-source-files.html
    https://docs.soliditylang.org/en/latest/structure-of-a-contract.html


    -----------------------------------
    Different Source Files
    -----------------------------------
        - Contrac
        - library
        - interface

    -----------------------------------
    Solidity Source Files Elements
    -----------------------------------    
        - License
        - pragma 
        - import
        - Contract definition
        - State Variables
        - Constructor
        - Functions
        - Function Modifiers
        - Events
        - Errors 
        - Struct Types
        - Enum Types

    -----------------------------------
    License
    -----------------------------------
    Every source file should start with a comment indicating its license:

        // SPDX-License-Identifier: MIT

    List of ifferent type of Licenses
        https://spdx.org/licenses/


    -----------------------------------
    Pragmas
    -----------------------------------

    The pragma directive is used to enable certain compiler features or checks.

        - Version Pragma

            Source files can (and should) be annotated with a version pragma 
            to reject compilation with future compiler versions that might introduce incompatible changes.

            pragma solidity >=0.4.16 <0.9.0;
            
            pragma solidity ^0.8.17;
                compiler version must be greater than or equal to 0.8.17 and less than 0.9.0


        - ABI Coder Pragma

            You can select between the two implementations of the ABI encoder and decoder:

            pragma abicoder v1; 
            pragma experimental ABIEncoderV2;    - Up to Solidity 0.7.4
            pragma abicoder v2;                  - it is default from Solidity 0.7.4


        - SMTChecker Pragma

             You can want to compiler to get additional safety warnings 

             pragma experimental SMTChecker;

    -----------------------------------
    Import
    -----------------------------------
    Solidity supports import statements to help modularise your code by importing other Source Files.

        import "filename";
        import * as symbolName from "filename";
        import "filename" as symbolName;
        import {symbol1 as alias, symbol2} from "filename";

    
    -----------------------------------
    Contract
    -----------------------------------
    Each solidity file have an arbitrary numbers of contract definitions.

        contract SimpleStorage {
            ...
        }


    -----------------------------------
    State Variables
    -----------------------------------
    State variables are variables whose values are permanently stored in contract storage.

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity >=0.4.0 <0.9.0;

        contract SimpleStorage {
            uint storedData;
        }


    -----------------------------------
    Constructor
    -----------------------------------
    A constructor is an optional function declared with the constructor keyword 
    which is executed upon contract creation, 
    and where you can run contract initialisation code.

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity >=0.4.0 <0.9.0;

        contract SimpleStorage {

            uint storedData;

            constructor() {
                storedData = 1;
            }
        }


    -----------------------------------
    Functions
    -----------------------------------
    Functions are the executable units of code. 
    Functions are usually defined inside a contract, 
    but they can also be defined outside of contracts.

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity >=0.7.1 <0.9.0;

        contract SimpleAuction {
            function bid() public payable {
            }
        }

        // Helper function defined outside of a contract

        function helper(uint x) pure returns (uint) {
            return x * 2;
        }


    -----------------------------------
    Function Modifiers
    -----------------------------------
    Function modifiers can be used to amend the semantics of functions 
    in a declarative way.

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.22 <0.9.0;

    contract Purchase {

        address public seller;

        modifier onlySeller() {
            require(msg.sender == seller, "Only seller can call this.");
            _;
        }

        function abort() public view onlySeller {
        }
    }


    -----------------------------------
    Events
    -----------------------------------
    Events are convenience interfaces with the EVM logging facilities.

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity >=0.4.21 <0.9.0;

        contract SimpleAuction {

            event HighestBidIncreased(address bidder, uint amount);

            function bid() public payable {
                ...    
                emit HighestBidIncreased(msg.sender, msg.value);
            }
        }

    
    -----------------------------------
    9- Errors
    -----------------------------------
    Errors allow you to define descriptive names and data for failure situations. 
    Errors can be used in revert statements. 
    In comparison to string descriptions, errors are much cheaper 
    and allow you to encode additional data. 

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity ^0.8.4;

        error NotEnoughFunds(uint requested, uint available);

        contract Token {

            mapping(address => uint) balances;

            function transfer(address to, uint amount) public {

                uint balance = balances[msg.sender];

                if (balance < amount)
                    revert NotEnoughFunds(amount, balance);

                balances[msg.sender] -= amount;
                balances[to] += amount;
                ...
            }
        }

    
    -----------------------------------
    10- Struct Types
    -----------------------------------
    Structs are custom defined types that can group several variables.

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity >=0.4.0 <0.9.0;

        contract Ballot {

            struct Voter { 
                uint weight;
                bool voted;
                address delegate;
                uint vote;
            }
        }


    -----------------------------------
    11- Enum Types
    -----------------------------------
    Enums can be used to create custom types with a finite set of ‘constant values’.

        // SPDX-License-Identifier: GPL-3.0
        pragma solidity >=0.4.0 <0.9.0;

        contract Purchase {
            enum State { Created, Locked, Inactive }
        }
    

        
*/