/*
    ----------------------
    Control Structures
    ----------------------
    https://docs.soliditylang.org/en/latest/control-structures.html
    
    Most of the control structures known from curly-braces languages are available in Solidity
    with the usual semantics known from C or JavaScript.
    
        - if
        - else

        - while
        - do
        - for
        - break
        - continue

        - return

    Error handling: 
    
        - assert
        - require
        - revert 

    Exception handling: 

        - try/catch
        

    Solidity supports exception handling in the form of try/catch-statements 
        but only for external function calls and contract creation calls. 
    
    Errors can be created using the revert statement.

    Parentheses can not be omitted for conditionals, 
        but curly braces can be omitted around single-statement bodies.

    Note that there is no type conversion from non-boolean to boolean types as there is in C and JavaScript

        => if (1) { ... } is not valid Solidity.
*/