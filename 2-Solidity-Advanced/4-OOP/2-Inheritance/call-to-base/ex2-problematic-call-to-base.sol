// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract owned {

    address payable owner;

    constructor() { 
        owner = payable(msg.sender); 
    }
}


contract Destructible is owned {

    function destroy() public virtual {

        if (msg.sender == owner) 
            // This will report a warning due to deprecated selfdestruct
            selfdestruct(owner);
    }
}


contract Base1 is Destructible {

    function destroy() public virtual override { 
        Destructible.destroy(); /* do cleanup 1 */
    }
}


contract Base2 is Destructible {

    function destroy() public virtual override { 
        Destructible.destroy(); /* do cleanup 2 */ 
    }
}


contract Final is Base1, Base2 {

    function destroy() public override(Base1, Base2) { 
        Base2.destroy(); 
    }
}




/*
    A call to Final.destroy() will call Base2.destroy 
        because we specify it explicitly in the final override, 
    but this function will bypass Base1.destroy. 
    The way around this is to use super:
*/