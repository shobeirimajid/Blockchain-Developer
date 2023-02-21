// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

/*
    We define a new struct datatype 
    that will be used to hold its data in the calling contract.
*/

struct Data {
    mapping(uint => bool) flags;
}


library ISet {

/*
    Note that the first parameter (self) is of type "storage reference" 
        and thus only its storage address 
        and not its contents 
        is passed as part of the call.  

    This is a special feature of library functions.  
    
    It is idiomatic to call the first parameter `self`, 
    if the function can be seen as a method of that object.
*/

    function insert(Data storage self, uint value) public returns (bool) {

        if (self.flags[value])
            return false; // already exixt there
        
        self.flags[value] = true;
        return true;
    }


    function remove(Data storage self, uint value) public returns (bool) {

        if (!self.flags[value])
            return false; // not exist there
       
        self.flags[value] = false;
        return true;  
    }


    function contains(Data storage self, uint value) public view returns (bool) {
        return self.flags[value];
    }
}



contract C {

    Data knownValues;

    function register(uint value) public {

        /*
            The library functions can be called without a specific instance of the library, 
            since the "instance" will be the current contract.
        */
        require(ISet.insert(knownValues, value));
    }

}


/*
    In this contract, if we want, we can also directly access :

        knownValues.flags


    libraries can also be used without defining struct data types. 
    Functions also work without any storage reference parameters, 
    and they can have multiple storage reference parameters and in any position.

    The calls to 
        ISet.contains
        ISet.insert 
        ISet.remove 
    are all compiled as calls (DELEGATECALL) to an external contract/library.
    


*/