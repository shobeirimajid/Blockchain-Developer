/*
    -------------
    Libraries
    -------------
    library is an isolated piece of source code

    if all library functions are internal
        - the library is embedded into the contract 
    Otherwise 
        - the library must be deployed and then linked before the contract is deployed


    Libraries are similar to contracts
    but : 
        - it is not possible to destroy a library
        - libraries are assumed to be stateless
        - libraries disallows state-modifying functions (like send ether) to be called directly (without DELEGATECALL)
        - they are deployed only once at a specific address
        - their code is reused using the DELEGATECALL (CALLCODE until Homestead) feature of the EVM
        - they cannot have state variables
        - they cannot inherit nor be inherited
        - they cannot receive Ether
        - they cannot be destroyed
    

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

    prior to Homestead: 
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



    -------------------------
    Function Signatures
    -------------------------
    While external calls to public or external library functions are possible, 
    the calling convention for such calls is considered to be internal to Solidity 
    and not the same as specified for the regular contract ABI. 
    
    External library functions support more argument types than external contract functions, 

    for example: 
        - recursive structs 
        - storage pointers
    
    For that reason, the 'function signatures' used to 
    compute the 4-byte selector 
    are computed following an internal naming schema and 
    arguments of types not supported in the contract ABI use an internal encoding.


    The following identifiers are used for the types in the signatures:

        - value types 
        - non-storage string 
        - non-storage bytes 
            use the same identifiers as in the contract ABI

        - Non-storage array types 
            follow the same convention as in the contract ABI, 
            i.e.    <type>[] for dynamic arrays     and 
                    <type>[M] for fixed-size arrays of M elements

        - Non-storage structs 
            are referred to by their fully qualified name, 
            i.e. C.S for contract C { struct S { ... } }

        Storage pointer mappings 
            use mapping(<keyType> => <valueType>) storage 

        Other storage pointer types 
            use the type identifier of their corresponding non-storage type, 
            but append a single space followed by storage to it

        
    The argument encoding is the same as for the regular contract ABI, 
        except for storage pointers, 
        which are encoded as a uint256 value referring to the storage slot to which they point.

    -------------------------
    Function Selectors
    -------------------------
    Similarly to the contract ABI, 
    the selector consists of the 'first four bytes' of the 'Keccak256-hash of the signature' 
    Its value can be obtained from Solidity using the .selector member.


    --------------------------------
    Call Protection For Libraries
    --------------------------------
    As mentioned in the introduction, 
    if a library’s code is executed using a CALL instead of a DELEGATECALL or CALLCODE, 
    it will revert unless a view or pure function is called.

    The EVM does not provide a direct way for a contract 
    to detect whether it was called using CALL or not, 
    but a contract can use the ADDRESS opcode to find out “where” it is currently running. 
    
    The generated code compares this address to the 
    address used at construction time to determine the mode of calling.

    More specifically, 
    the runtime code of a library always starts with a push instruction, 
    which is a zero of 20 bytes at compilation time. 
    When the deploy code runs, this constant is replaced in memory by the current address 
    and this modified code is stored in the contract. 
    
    At runtime, this causes the 'deploy time address' to be the 
    first constant to be pushed onto the stack 
    and the dispatcher code compares the current address against this constant 
    for any non-view and non-pure function.

    This means that 
    the actual code stored on chain for a library 
    is different from the code reported by the compiler as deployedBytecode.


    ------------------
    Using For
    ------------------
    The directive 
        using A for B; 
    can be used to attach functions (A) as 'member functions' to any type (B). 
    
    These functions will receive the object they are called on as their first parameter 
    (like the self variable in Python).

    It is valid either at file level or inside a contract, at contract level.


    The first part, A, can be one of:

        (1) A list of file-level or library functions 
                e.g. 
                using {f, g, h, L.t} for uint;

                only those functions will be attached to the type as member functions. 
                Note that private library functions can only be specified when using for is inside the library


        (2) The name of a library
                e.g. 
                using L for uint;
                all non-private functions of the library are attached to the type.

    
    At file level, 
    the second part, B, has to be an explicit type (without data location specifier). 

    Inside contracts, you can also use * in place of the type
        e.g. 
        using L for *;

    which has the effect that all functions of the library L are attached to all types.


    If you specify a library, 
    all functions in the library get attached,
    even those where the type of the first parameter does not match the type of the object. 
    The type is checked at the point the function is called and function overload resolution is performed.

    If you use a list of functions
        e.g. 
        using {f, g, h, L.t} for uint;
    then the type (uint) has to be implicitly convertible to the first parameter of each of these functions. 
    This check is performed even if none of these functions are called.

    The using A for B; 
    directive is active only within the current scope 
    (either the contract or the current module/source unit), 
    including within all of its functions, 
    and has no effect outside of the contract or module in which it is used.

    When the directive is used at file level 
    and applied to a user-defined type which was defined at file level in the same file, 
    the word global can be added at the end. 
    This will have the effect that 
    the functions are attached to the type everywhere the type is available (including other files), 
    not only in the scope of the using statement.


    ------------------
    Note 
    ------------------
    all external library calls are actual EVM function calls. 

    This means that if you pass memory or value types, a copy will be performed, 
    even in case of the self variable. 

    The only situation where no copy will be performed 
    is when storage reference variables are used 
    or when internal library functions are called.

*/