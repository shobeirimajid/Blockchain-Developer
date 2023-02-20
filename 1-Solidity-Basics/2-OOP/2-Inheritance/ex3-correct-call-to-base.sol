// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Owned {

    address payable owner;

    constructor() { 
        owner = payable(msg.sender); 
    }
}


contract Destructible is Owned {

    function destroy() virtual public {

        if (msg.sender == owner) 
            // This will report a warning due to deprecated selfdestruct
            selfdestruct(owner);
    }
}


contract Base1 is Destructible {

    function destroy() public virtual override { 

        super.destroy();  /* do cleanup 1 */ 
    }
}


contract Base2 is Destructible {

    function destroy() public virtual override { 

        super.destroy();  /* do cleanup 2 */ 
    }
}


contract FinalContract is Base1, Base2 {

    function destroy() public override(Base1, Base2) { 

        super.destroy(); 
    }
}



/*
                                 Owned
                                   |
                                   |
                              Destructible
                                  / \
                                 /   \
                                /     \
                             Base1   Base2
                                \     /
                                 \   /
                                  \ /
                             FinalContract



                      final inheritance sequence

         FinalContract - Base2 - Base1 - Destructible - Owned   

         
    If Base2 calls a function of super, 
        it does not simply call this function on one of its base contracts. 
    
    Rather, it calls this function on the next base contract in the final inheritance graph, 
        so it will call Base1.destroy() 
        
    The actual function that is called when using super 
        is not known in the context of the Contract where it is used,
        although its type is known. 

    This is similar for ordinary virtual method lookup.
*/