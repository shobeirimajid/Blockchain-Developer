// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Owned {

    address payable owner;

    constructor() { 
        owner = payable(msg.sender); 
    }
}



/*
    ---------------------
    Dreved is Base
    ---------------------
    Use `is` to derive from another contract.
    Derived contracts can access all `non-private` members including:
        - internal functions 
        - state variables
    These cannot be accessed externally via `this`
*/

contract Destructible is Owned {

    /*
        ---------------------
        virtual function
        ---------------------
        The keyword `virtual` means that the function can change its behaviour in derived contracts.
    */

    function destroy() virtual public {
        if (msg.sender == owner) 
            // This will report a warning due to deprecated selfdestruct
            selfdestruct(owner);
    }
}



/*
    ---------------------
    abstract contracts
    ---------------------
    abstract contracts are only provided to make the interface known to the compiler.
    Note the function without body.
    If a contract does not implement all functions, it can only be used as an interface.
*/

abstract contract Config {
    function lookup(uint id) public virtual returns (address adr);
}


abstract contract NameReg {
    function register(bytes32 name) public virtual;
    function unregister() public virtual;
}



/*
    ---------------------
    Multiple inheritance
    ---------------------
    Multiple inheritance is possible in solidity.
    Note that `Owned` is also a base class of `Destructible`,
    yet there is only a single instance of `Owned` (as for virtual inheritance in C++)
*/

contract Named is Owned, Destructible {

    constructor(bytes32 name) {
        Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
        NameReg(config.lookup(1)).register(name);
    }


    /*
        ---------------------
        function overriding
        ---------------------
        Functions can be overridden by another function with the same signature
            (same name and the same number/types of input parameters)

        If the overriding function has different types of output parameters, that causes an error.

        Both local and message-based function calls take these overrides into account.
    
        ---------------------------------------
        `override` & `virtual` keywords
        ---------------------------------------
        If you want the function to override, you need to use the `override` keyword.
        You need to specify the `virtual` keyword again if you want this function to be overridden again.
    */

    function destroy() public virtual override {

        if (msg.sender == owner) {

            Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
            NameReg(config.lookup(1)).unregister();

            // It is still possible to call a specific overridden function.
            Destructible.destroy();

            /*
                ---------
                Note 
                ---------
                we call Destructible.destroy() to “forward” the destruction request. 
                The way this is done is problematic!
                As we'll see in the next example, The way around this is to use of 
                'super.destroy()' instead of 'Destructible.destroy()' 
            */

        }
    }
}



/*
    ------------------------------
    base constructor's arguments
    ------------------------------
    If a base contract's constructor takes an argument, 
    it needs to be provided 
        - in the header  
        - or in modifier-invocation-style at the constructor of the derived contract
*/

contract PriceFeed is Owned, Destructible, Named("GoldFeed") {

    uint info;

    function updateInfo(uint newInfo) public {
        if (msg.sender == owner) 
            info = newInfo;
    }


    /*
        Here, we only specify `override` and not `virtual`.
        This means that contracts deriving from `PriceFeed`
        cannot change the behaviour of `destroy` anymore.
    */

    function destroy() public override(Destructible, Named) { 
        Named.destroy();
    }


    function get() public view returns(uint r) { 
        return info; 
    }
}