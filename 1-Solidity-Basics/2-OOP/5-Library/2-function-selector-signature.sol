/*
    ---------------------------------------------------
    Function Signatures & Function Selectors in Libraries
    ---------------------------------------------------
    While external calls to public or external library functions are possible, 
    the calling convention for such calls is considered to be internal to Solidity
     and not the same as specified for the regular contract ABI. 
     
     External library functions support more argument types than external contract functions, 
     for example recursive structs and storage pointers. 
     For that reason, 
     the function signatures used to compute the 4-byte selector 
     are computed following an internal naming schema and arguments of types not supported in the contract ABI use an internal encoding.

    The following identifiers are used for the types in the signatures:

    Value types, non-storage string and non-storage bytes use the same identifiers as in the contract ABI.

    Non-storage array types follow the same convention as in the contract ABI, i.e. <type>[] for dynamic arrays and <type>[M] for fixed-size arrays of M elements.

    Non-storage structs are referred to by their fully qualified name, i.e. C.S for contract C { struct S { ... } }.

    Storage pointer mappings use mapping(<keyType> => <valueType>) storage where <keyType> and <valueType> are the identifiers for the key and value types of the mapping, respectively.

    Other storage pointer types use the type identifier of their corresponding non-storage type, but append a single space followed by storage to it.

    The argument encoding is the same as for the regular contract ABI, except for storage pointers, which are encoded as a uint256 value referring to the storage slot to which they point.

    Similarly to the contract ABI, the selector consists of the first four bytes of the Keccak256-hash of the signature. Its value can be obtained from Solidity using the .selector member as follows:

*/