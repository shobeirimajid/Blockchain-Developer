/*
    ---------------------
    Abstract Contracts
    ---------------------
    Contracts must be marked as abstract when :
        - at least one of their functions is not implemented 
        - or when they do not provide arguments for all of their base contract constructors. 
    
    Even if this is not the case, a contract may still be marked abstract, 
    such as when :
        - you do not intend for the contract to be created directly. 
    

    Abstract contracts are similar to "Interfaces"

    but an interface is "more limited" in what it can declare.

    An abstract contract is declared using the "abstract" keyword


    ------------------------
    Abstract & Inheritance
    ------------------------
    If a contract inherits from an abstract contract 
    and does not implement all non-implemented functions by overriding, 
    it needs to be marked as abstract as well.


    ----------------------------------
      function without implementation
                    &
               Function Type
    ----------------------------------
    Note that a function without implementation is different from a Function Type 
    even though their syntax looks very similar.

    Example of function without implementation (a function declaration):

        function foo(address) external returns (address);


    Example of a declaration of a variable whose type is a function type:

        function(address) external returns (address) foo;



    ----------------------------------------
    extensibility & self-documentation
    ----------------------------------------
    Abstract contracts decouple the definition of a contract from its implementation 
    providing better extensibility and self-documentation 
    and facilitating patterns like the :

        - Template Method 
        - Removing Code Duplication
    
    Abstract contracts are useful 
    in the same way that defining methods in an interface is useful. 
    It is a way for the designer of the abstract contract to say :

        “any child of mine must implement this method”


    ------------------
    Note
    ------------------
    Abstract contracts cannot override an implemented virtual function with an unimplemented one.

*/