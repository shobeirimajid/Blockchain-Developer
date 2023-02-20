/*
    -------------
    Libraries
    -------------
    Libraries are similar to contracts


    but : 
        - library is an isolated piece of source code
        - it is not possible to destroy a library
        - libraries are assumed to be stateless
        - libraries disallows state-modifying functions to be called directly (without DELEGATECALL)
        - they are deployed only once at a specific address
        - their code is reused using the DELEGATECALL (CALLCODE until Homestead) feature of the EVM
    

    This means that if library functions are called, 
        their code is executed in the context of the calling contract, 
         i.e. this points to the calling contract, 
         and especially the storage from the calling contract can be accessed. 
        

    As a library is an isolated piece of source code, 
    it can only access state variables of the calling contract 
      if they are explicitly supplied (it would have no way to name them, otherwise). 
      
    libraries are assumed to be stateless, so
     Library functions can only be called directly (without DELEGATECALL) 
     if they do not modify the state (view or pure functions)
    
    
    -----------
    Note
    -----------
    Until version 0.4.20, 
    it was possible to destroy libraries by circumventing Solidity’s type system. 
    Starting from that version, libraries contain a mechanism that :
        disallows state-modifying functions to be called directly (without DELEGATECALL)


    -------------------------------------------------------
    calls to library functions
    -------------------------------------------------------
    Libraries can be seen as implicit base contracts of the contracts that use them. 
    They will not be explicitly visible in the inheritance hierarchy, 
     but calls to library functions look just like calls to functions of explicit base contracts 
        using qualified access like L.f()

    Of course, calls to internal functions use the internal calling convention, 
     which means that all internal types can be passed 
     and types stored in memory will be passed by reference and not copied. 
     
     To realize this in the EVM, 
     the code of internal library functions that are called from a contract 
     and all functions called from therein will at compile time be included in the calling contract, 
     and a regular JUMP call will be used instead of a DELEGATECALL.


    ---------------
     Note
     ---------------
     The inheritance analogy breaks down when it comes to public functions. 

     Calling a public library function with L.f() 
        results in an 'external call' (DELEGATECALL)

     In contrast
        A.f() is an 'internal call' when A is a base contract of the current contract

    
    If you use libraries, be aware that an actual external function call is performed. 
        and
            msg.sender
            msg.value
            this 
        will retain their values in the call

    prior to Homestead, 
    because of the use of CALLCODE
    msg.sender and msg.value changed

    -----------------------
    address of a library
    -----------------------
    It is possible to obtain the address of a library 
    by converting the library type to the address type
    
        address(LibraryName)

    As the compiler does not know the address where the library will be deployed, 
    the compiled hex code will contain placeholders of the form :

        __$30bbc0abd4d6364515865950d3e0d10953$__
        
    The placeholder is a 34 character prefix of the hex encoding 
     of the keccak256 hash of the fully qualified library name, 
     which would be for example:

        libraries/bigint.sol:BigInt 

        if the library was stored in:

        a file called 
            bigint.sol 

        a directory called
            libraries/
    

    Such bytecode is incomplete and should not be deployed. 
    Placeholders need to be replaced with actual addresses. 
    You can do that by either :
    
        - passing them to the compiler when the library is being compiled 

        - or by using the linker to update an already compiled binary. 
    

    See Library Linking for information on how to use the commandline compiler for linking.
        https://docs.soliditylang.org/en/latest/using-the-compiler.html#library-linking


    In comparison to contracts, libraries are restricted in the following ways:

        (1) they cannot have state variables

        (2) they cannot inherit nor be inherited

        (3) they cannot receive Ether

        (4) they cannot be destroyed


*/