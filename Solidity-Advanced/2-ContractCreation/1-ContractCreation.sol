/*
    -----------------------------------------
    Contracts
    -----------------------------------------

    https://docs.soliditylang.org/en/v0.8.18/contracts.html#contracts

    "Contracts" in Solidity are similar to "classes" in object-oriented languages. 
    They contain 
        "persistent data" in state variables, 
        "functions" that can "modify" these variables. 
    
    Calling a function on a different contract (instance) will perform an EVM "function call" 
        and thus switch the "context" such that state variables in the "calling contract" are "inaccessible" 
        
    A contract and its functions need to be called for anything to happen. 
        There is no “cron” concept in Ethereum to call a function at a particular event automatically.



    -----------------------------------------
    Contract Creating
    -----------------------------------------

    Contracts can be created 
        from "outside" via Ethereum transactions
        from "within" Solidity contracts


    IDEs, such as Remix, make the creation process seamless using UI elements.


    One way to create contracts programmatically on Ethereum :
        via the JavaScript API "web3.js"
        It has a function called "web3.eth.Contract" to facilitate contract creation


    When a contract is "created", its constructor is executed once
        - Constructor is a function declared with the constructor keyword
        - Constructor is optional
        - Only one constructor is allowed and Overloading is not supported


    After the constructor has executed, the "final code" of the contract is stored on the blockchain.

    Deployed code includes :
        - all "public" and "external" functions 
        - all functions that are reachable from there "through function calls"
    
    Deployed code does not include :
        - constructor code
        - internal functions only called from the constructor


    Internally, 
        "constructor arguments" are passed "ABI encoded" after the code of the contract itself, 
        but if you use "web3.js" you do not have to care about this 


    Note:

        If a contract wants to create another contract, 
            the source code (and the binary) of the created contract has to be known to the creator. 
            
            This means that "cyclic creation dependencies" are impossible:



    -----------------------------------------
    Contract Creating (via new)
    -----------------------------------------

    https://docs.soliditylang.org/en/v0.8.18/contracts.html#creating-contracts
   

    A contract can "create other contracts" using the "new" keyword.

    The "full code" of the contract being created has to be known when the "creating contract" is compiled
        so "recursive" creation-dependencies are not possible.


    As seen in the example, it is possible to "send Ether" while "creating an instance" of Contract D using the "value" option,
        but it is not possible to "limit" the "amount of gas"
     
    If the creation fails (due to out-of-stack, not enough balance or other problems), an exception is thrown.



    -----------------------------------------
    Salted contract creations (create2)
    -----------------------------------------

    When creating a contract, the "address of the contract" is computed from the :

        1. address of the creating contract 
        2. a counter (nonce) that is increased with each contract creation


    If you specify the option "salt" (a bytes32 value)
        then contract creation will use a different mechanism to come up with the "address of the new contract" :
        It will compute the address from the
            1. address of the creating contract
            2. given salt value
            3. the (creation) bytecode of the created contract 
            4. the constructor arguments

    In particular, the counter (nonce) is not used
    This allows for more flexibility in creating contracts: 
        - You are able to derive the "address" of the new contract "before it is created"
        - You can rely on this address also in case the creating contracts creates other contracts in the meantime

    The main "use-case" here is contracts that act as judges for off-chain interactions, 
        which only need to be created if there is a dispute.


    Warning:

    There are some peculiarities in relation to "salted creation" :

    * A contract can be "re-created" at the "same address" after having been destroyed.

    * Yet, it is possible for that "newly created contract" to have a "different deployed bytecode" 
        even though the "creation bytecode" has been the same
        (which is a requirement because otherwise the address would change). 
        This is due to the fact that the constructor can query external state 
            that might have changed between the two creations and incorporate that into the deployed bytecode before it is stored.

*/

