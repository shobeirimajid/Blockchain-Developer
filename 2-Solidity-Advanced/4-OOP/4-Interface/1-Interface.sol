/*
    --------------
    nterfaces
    --------------
        
        - You can interact with other contracts by declaring an Interface.
        - Interfaces are denoted by keyword 'interface'
        - Interfaces can inherit from other interfaces

    Interfaces are similar to "abstract contracts"
    but there are some restrictions:

        (1) They cannot have any functions implemented

        (2) They cannot inherit from other contracts, but they can inherit from other interfaces

        (3) All declared functions must be external in the interface, even if they are public in the contract

        (4) They cannot declare a constructor

        (5) They cannot declare state variables

        (6) They cannot declare modifiers


    Interfaces are basically limited to what the Contract ABI can represent, 
    and the conversion between the ABI and an interface should be possible without any information loss.


    --------------------------
    inheriting the interfaces
    --------------------------
    Contracts can inherit interfaces as they would inherit other contracts.

    All functions declared in interfaces are implicitly 'virtual'
     and any functions that override them do not need the override keyword. 

    This does not automatically mean that an overriding function can be overridden again 
        - this is only possible if the overriding function is marked virtual.

    Interfaces can inherit from other interfaces. 
     This has the same rules as normal inheritance.

    
    Types defined inside interfaces and other contract-like structures 
        can be accessed from other contracts.

*/