/*
    ----------------------------
    Function Overloading
    ----------------------------
    A contract can have multiple functions of the same name 
    but with different parameter types. 
    
    This process is called “overloading” 
    and also applies to inherited functions. 
    
    Overloaded functions are also present in the external interface. 

    It is an error if 
        two externally visible functions differ by their Solidity types 
        but not by their external types


    --------------------------------------------------
    Overload resolution and Argument matching
    --------------------------------------------------
    Overloaded functions are selected by matching the function declarations
     in the current scope to the arguments supplied in the function call. 
     
    Functions are selected as overload candidates 
     if all arguments can be implicitly converted to the expected types. 
     If there is not exactly one candidate, resolution fails.

    ----------------------
     Note
    ----------------------
    Return parameters are not taken into account for overload resolution.
*/