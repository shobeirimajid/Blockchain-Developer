/*
    -----------------
    Constructors
    -----------------
    A constructor is an optional function declared with the constructor keyword 
    which is executed when:

        (1) contract creation
        (2) run contract initialisation code


    Before the constructor code is executed, state variables are initialised :
        to their specified value if you initialise them inline
        or their default value if you do not


    After the constructor has run, 
    the final code of the contract is deployed to the blockchain. 
    
    The deployment of the code costs additional gas linear to the length of the code. 
    This code includes :
        - all functions that are part of the public interface 
        - and all functions that are reachable from there through function calls. 
        - It does not include the constructor code or internal functions that are only called from the constructor.


    If there is no constructor, 
    the contract will assume the default constructor, 
    which is equivalent to:
    
         constructor() {}

    
    You can use internal parameters in a constructor (for example storage pointers). 
    In this case, the contract has to be marked "abstract"

        because these parameters cannot be assigned valid values from outside 
        but only through the constructors of derived contracts.


    ---------
    Warning
    ---------
    Prior to version 0.4.22, 
    constructors were defined as functions with the same name as the contract.
     This syntax was deprecated and is not allowed anymore in version 0.5.0.

    Prior to version 0.7.0, 
    you had to specify the visibility of constructors as either internal or public.


    ----------------------------------
    Arguments for Base Constructors
    ----------------------------------
    The constructors of all the base contracts 
        will be called following the linearization rules explained below.

    If the base constructors have arguments, 
    derived contracts need to specify all of them.


    One way is directly in the inheritance list :

        Inherited is Base(7) 

    This way is more convenient if the constructor argument is a constant 
    and defines the behaviour of the contract or describes it. 


    The other is in the way a modifier is invoked as part of the derived constructor :

        Base(y * y)

    This way has to be used if the constructor arguments of the base depend on those of the derived contract. 
    Arguments have to be given either in the inheritance list or in modifier-style in the derived constructor.

    Specifying arguments in both places is an error.


    If a derived contract does not specify the arguments to all of its base contracts’ constructors, 
    it must be declared abstract. 
    In that case, when another contract derives from it, 
    that other contract’s inheritance list or constructor 
        must provide the necessary parameters 
        for all base classes that haven’t had their parameters specified 
        (otherwise, that other contract must be declared abstract as well). 
        


*/