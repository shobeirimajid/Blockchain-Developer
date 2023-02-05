
/**

    /// https://docs.soliditylang.org/en/v0.8.18/types.html#reference-types 

    Values of "reference type" can be modified through multiple different names. 

    Contrast this with "value types" where you get an independent copy whenever a variable of "value type" is used. 

    Because of that, "reference types" have to be handled more carefully than value types. 
    
    Currently, reference types comprise :
        - structs
        - arrays
        - mappings
    

    If you use a reference type, you always have to explicitly provide the "data area" where the type is stored:

        - memory
            whose lifetime is limited to an "external function call"

        - storage
            the location where the "state variables" are stored
            where the lifetime is limited to the "lifetime of a contract" 

        - calldata
            special data location that contains the "function arguments"

    An "assignment" or "type conversion" that changes the "data location" will always incur an "automatic copy operation"
        while assignments "inside the same data location" only copy in some cases for "storage types"



    1. Data location

        Every "reference type" has an additional annotation, the “data location”, about where it is stored. 
        
        There are three data locations: 
            1- memory
            2- storage
            3- calldata
        
        "calldata" is a :
            non-modifiable and
            non-persistent area 
            where "function arguments" are stored and
            behaves mostly like "memory"

        Note:
            If you can, try to use "calldata" as "data location", because:
                1. it will "avoid copies"
                2. it makes sure that the "data cannot be modified"

            "Arrays" and "structs" with calldata data location can also be returned from functions, 
                but it is not possible to allocate such types.

        Note:
            Prior to version 0.6.9 "data location" for "reference-type arguments" was limited to:

                "calldata" in "external functions"
                "memory" in "public functions" 
                "memory or storage" in "internal and private functions"

            Now "memory" and "calldata" are allowed in all functions regardless of their visibility.

        Note:
            Prior to version 0.5.0 the "data location" could be omitted, 
                and would "default" to different locations depending on the "kind of variable, function type, etc." 

            but now "all complex types" must give an "explicit data location"



        Data location and assignment behaviour

            Data locations are not only relevant for "persistency of data" but also for the "semantics of assignments":

                1. Assignments between "storage" and "memory" (or from calldata) always create an "independent copy"

                2. Assignments from "memory" to "memory" only create "references". 
                    This means that changes to one memory variable are also visible in all other memory variables that refer to the same data

                3. Assignments from "storage" to a "local storage variable" also only "assign a reference"

                4. All "other assignments" to "storage" always copy.
                    Examples for this case are:
                        - assignments to state variables or 
                        - assignments to members of local variables of storage struct type
                            even if the local variable itself is just a reference
*/



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract DataLocation {

    /// The data location of x is storage.
    /// This is the only place where the data location can be omitted.
    uint[] x;

    /// The data location of memoryArray is memory.
    function f(uint[] memory memoryArray) public {

        /// works
        /// copies the whole array to storage
        x = memoryArray; 

        /// works
        /// assigns a pointer
        /// data location of y is storage
        uint[] storage y = x;

        /// works
        /// returns the 8th element
        y[7]; 

        /// works
        /// modifies x through y
        y.pop(); 

        /// works
        /// clears the array, also modifies y
        delete x; 

        /// does not work! 
        /// it would need to create a new temporary unnamed array in "storage", but storage is "statically" allocated
        y = memoryArray;

        /// does not work! 
        /// as assignments to local variables, "referencing storage objects" can only be made from "existing storage objects"
        /// It "would reset the pointer", but "there is no sensible location it could point to".
        /// see: https://docs.soliditylang.org/en/v0.8.18/types.html#delete
        delete y;

        /// works
        /// calls g
        /// and handing over a reference to x
        g(x); 

        /// works
        /// calls h 
        /// and creates an independent, temporary copy in memory
        h(x); 
    }

    function g(uint[] storage) internal pure {}
    function h(uint[] memory) public pure {}
}