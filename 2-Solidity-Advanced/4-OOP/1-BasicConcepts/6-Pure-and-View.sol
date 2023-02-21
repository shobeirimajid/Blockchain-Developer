/*
    ------------------
    State Mutability
    ------------------
    - View 
    - Pure


    ------------------
    View Functions
    ------------------
    Functions can be declared "view" in which case they promise not to modify the state.

    ------------------
    Note
    ------------------
    If the compiler’s EVM target is Byzantium or newer (default) :

    when "view functions" are called
    the used opcode is :  STATICCALL 
    which enforces the state to stay unmodified as part of the EVM execution. 
    By using STATICCALL for view functions, modifications to the state are prevented on the level of the EVM.


    when "library view functions" are called
    the used opcode is :  DELEGATECALL 
    because there is no combined DELEGATECALL and STATICCALL

            This means library view functions do not have run-time checks that prevent state modifications. 
            This should not impact security negatively 
            because library code is usually known at compile-time 
            and the static checker performs compile-time checks.

    
    ------------------------------------
    state modifying statements
    ------------------------------------
    The following statements are considered modifying the state:

        - Writing to state variables
        - Emitting events
        - Creating other contracts
        - Using selfdestruct
        - Sending Ether via calls
        - Calling any function not marked view or pure
        - Using low-level calls
        - Using inline assembly that contains certain opcodes


    ---------------
    Note
    ---------------
    Getter methods are automatically marked view



    ------------------
    Pure  Functions
    ------------------
    Functions can be declared pure in which case they promise not to read from or modify the state. 
    In particular, it should be possible to evaluate a pure function at compile-time 
        given only its inputs and msg.data, 
        but without any knowledge of the current blockchain state. 
    This means that reading from immutable variables can be a non-pure operation.

    ---------------
    Note
    ---------------
    If the compiler’s EVM target is Byzantium or newer (default) 
    the opcode STATICCALL is used, 
    which does not guarantee that the state is not read, 
    but at least that it is not modified.


    ------------------------------------
    state reading statements
    ------------------------------------
    The following statements are reading from the state:

        - Reading from state variables
        - Accessing address(this).balance or <address>.balance
        - Accessing any of the members of block, tx, msg (with the exception of msg.sig and msg.data)
        - Calling any function not marked pure
        - Using inline assembly that contains certain opcodes

    
    Pure functions are able to use the following functions 
    to revert potential state changes when an error occurs :
        revert() 
        require()

    Reverting a state change is not considered a “state modification”
    as only changes to the state made previously 
    in code that did not have the view or pure restriction are reverted 
    and that code has the option to catch the revert and not pass it on.

    This behaviour is also in line with the STATICCALL opcode.

    -------------------
    Warning
    -------------------
    It is not possible to prevent functions from reading the state at the level of the EVM, 
    it is only possible to prevent them from writing to the state 
    i.e. only view can be enforced at the EVM level, pure can not.


    -------------------
    Note
    -------------------
    Prior to version 0.5.0, 
    the compiler did not use the STATICCALL opcode for pure functions. 
    This enabled state modifications in pure functions through the use of invalid explicit type conversions. 
    By using STATICCALL for pure functions, modifications to the state are prevented on the level of the EVM.

    -------------------
    Note
    -------------------
    Prior to version 0.4.17 
    the compiler did not enforce that pure is not reading the state. 
    It is a compile-time type check, 
    which can be circumvented doing invalid explicit conversions between contract types, 
    because the compiler can verify that the type of the contract does not do state-changing operations, 
    but it cannot check that the contract that will be called at runtime is actually of that type.
*/