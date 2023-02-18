/*
    ----------------------
    Contracts
    ----------------------
    Contracts in Solidity are similar to "classes" in object-oriented languages. 

    Contracts contain 
        (1) state variables - persistent data in blockchain
        (2) functions - that can read or modify state variables
        
    Calling a function on a different contract (instance) 
        will perform an EVM "function call" 
        and thus "switch" the "context" 
            such that state variables in the calling contract (caller) are inaccessible. 
        
    A contract and its functions need to be called for anything to happen. 

        -----------
        Note
        -----------
        There is no “cron” concept in Ethereum to call a function at a particular event automatically.
        Although there are some third-party services such as that can do it!
            - Ethereum Clock
            - ChainLink Job Scheduling Oracles


    ----------------------
    Creating Contracts
    ----------------------
    Contracts can be created :
    
        (1) via Ethereum transactions (Remix, Web3.js, ...)
        (2) from within Solidity contracts (create, create2)

        -------------------------
        Remix
        -------------------------
        IDEs, such as Remix, make the creation process seamless using UI elements.

        -------------------------
        JavaScript API web3.js
        -------------------------
        One way to create contracts programmatically on Ethereum is via the "JavaScript API web3.js"
        It has a function called "web3.eth.Contract" to facilitate contract creation.
         https://web3js.readthedocs.io/en/v1.8.2/web3-eth-contract.html


    -------------------------
    constructor
    -------------------------
    constructor is a function declared with the constructor keyword.
    A constructor is optional. 
    Only one constructor is allowed, which means overloading is not supported.

    When a contract is created
        (1) its constructor is executed once
        (2) After that, the final code of the contract is stored on the blockchain

    
    --------------------------------------
    What will be stored on the blockchain
    --------------------------------------
    When the contract has been compiled and deployed (its constructor is executed), then
    the "bytecode" of the contract will be stored on the blockchain.

    The deployed code (bytecode) includes:

        (1) all "public" and "external" functions 
        (2) all functions that are "reachable" from there through "function calls"
        

    The deployed code (bytecode) does not include:

        (1) the "constructor" code
        (2) the "internal functions" only called from the "constructor"


    --------------------------------------
    What about the constructor arguments?
    --------------------------------------
    "constructor arguments" are passed "ABI encoded" along with "contract code"

        =>  abi.encodepacked(contract_bytecode, constructure_arguments)

            Contract ABI Specification:
            https://docs.soliditylang.org/en/latest/abi-spec.html#abi

    if you are using "web3.js" for contract creation
        you do not have to care about how to pass the constructor arguments.
*/