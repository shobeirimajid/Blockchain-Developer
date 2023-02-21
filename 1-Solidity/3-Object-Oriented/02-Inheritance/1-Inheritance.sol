/*
    ---------------
    Inheritance
    ---------------
    https://docs.soliditylang.org/en/latest/contracts.html#inheritance
    


    ---------------
    Polymorphism
    ---------------
    Solidity supports multiple inheritance including "polymorphism"

    Polymorphism means that a function call (internal and external) 
    always executes the function of the same signature (same name and parameter types)
      in the most derived contract in the inheritance hierarchy. 

    This has to be explicitly enabled on each function in the hierarchy 
        using the 'virtual' and 'override' keywords. 

    More details about "Function Overriding" are provided in the following.

    If you want to call the function one level higher up in the flattened inheritance hierarchy
        it is possible to call functions further up in the inheritance hierarchy internally
        by explicitly specifying the contract using :

            ContractName.functionName() or 
            super.functionName() 


    When a contract inherits from other contracts, 
        only a single contract is created on the blockchain, 
        and the code from all the base contracts is compiled into the created contract. 
    
        This means that all 'internal calls' to functions of base contracts 
        also just use internal function calls 

        Note: super.f() will use JUMP and not a message call



    ------------------------
    State variable shadowing
    ------------------------
    State variable shadowing is considered as an error. 
    A derived contract can only declare a state variable x, 
        if there is no visible state variable with the same name in any of its bases.

      
    The general inheritance system is very similar to Python’s
        https://docs.python.org/3/tutorial/classes.html#inheritance
    especially concerning multiple inheritance

    but there are also some differences
        https://docs.soliditylang.org/en/latest/contracts.html#multi-inheritance

    

    -----------------------------------------------------------
    Inheriting Different Kinds of Members of the Same Name
    -----------------------------------------------------------
    It is an error when 
    any of the following pairs in a contract have the same name due to inheritance:

        - a function and a modifier

        - a function and an event

        - an event and a modifier

    an exception:

        - a "state variable getter" can override an "external function"

*/