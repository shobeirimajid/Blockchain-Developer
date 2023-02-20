/*
    ---------------------------
    Function Overriding
    ---------------------------
    Base functions can be overridden by inheriting contracts to change their behavior 
        if they are marked as virtual. 
        
    The overriding function must then use the override keyword in the function header. 
    

    ---------------------------
    change the visibility
    ---------------------------
    The overriding function may only change the visibility of the overridden function

        external --> public 


    ---------------------------
    change the mutability
    ---------------------------
    The mutability may be changed to a 'more strict' one following the order: 

        nonpayable  -- overridden -->   view | pure

           view     -- overridden -->       pure 

          payable   -- is an exception and cannot be changed to any other mutability.


    ------------------------------------------------
    Explicit Override
    ------------------------------------------------
    for multiple inheritance, 
        the most derived base contracts that define the same function 
        must be specified explicitly after the override keyword. 
    
    In other words, 
        you have to specify all base contracts that define the same function 
        and have not yet been overridden by another base contract 
        (on some path through the inheritance graph)
        
    Additionally, if a contract inherits the same function from multiple (unrelated) bases, 
        it has to 'explicitly' override it.


    An explicit override specifier is not required 
        - if the function is defined in a common base contract  
        - or if there is a unique function in a common base contract that already overrides all other functions

        More formally, it is not required to override a function
        inherited from multiple bases (directly or indirectly)
        if there is a base contract that is part of all override paths for the signature,  

        (1) and that base implements the function 
            and no paths from the current contract to the base mentions a function with that signature 

        (2) or that base does not implement the function 
            and there is at most one mention of the function in all paths from the current contract to that base.

        In this sense, an override path for a signature 
            is a path through the inheritance graph that starts at the contract under consideration 
            and ends at a contract mentioning a function with that signature that does not override.


    -----------------------------
    Stop the overriding
    -----------------------------
    If you do not mark a function that overrides as virtual, 
        derived contracts can no longer change the behaviour of that function.

    
    -------------------
    Note
    -------------------
    Functions with the private visibility cannot be virtual


    -------------------
    Note
    -------------------
    Functions without implementation have to be marked virtual outside of interfaces. 
        In interfaces, all functions are automatically considered "virtual"

    
    -------------------
    Note
    -------------------
    Starting from Solidity 0.8.8, 
    the override keyword is not required when overriding an interface function, 
    except for the case where the function is defined in multiple bases.


    ---------------------------------------------------------------
    external functions overriding via Public state variables
    ---------------------------------------------------------------
    Public state variables can override external functions 
    if the parameter and return types of the function matches the getter function of the variable:


        contract A {
            function f() external view virtual returns(uint) { 
                return 5; 
            }
        }

        contract B is A {
            uint public override f;
        }


        -------------------
        Note
        -------------------
        While public state variables can override external functions, 
        they themselves cannot be overridden.
*/