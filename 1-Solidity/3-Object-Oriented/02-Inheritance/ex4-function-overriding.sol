// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

//---------------------------
//         Example 1
//---------------------------

contract A {
    function foo() virtual external view {}
}

contract B is A {

}

contract C is B {
    function foo() override public pure {}
}


/*
    (C.foo) override (A.foo)
    mutability:  view      -->  pure
    visibility:  external  -->  public
*/



//---------------------------
//         Example 2
//---------------------------

contract Base1 {
    uint x1;

    function foo() virtual public returns (uint) {
        return x1;
    }
}


contract Base2 {
    uint x2;

    function foo() virtual public returns (uint) {
        return x2;
    }
}


contract Inherited is Base1, Base2 {

    uint x3;
    uint x4;

    // Derives from multiple bases defining foo() 
    // so we must explicitly override it

    function foo() public view override(Base1, Base2) returns (uint) {
        if(x3>x4)
            return x3;
        else
            return x4;
    }
}



//---------------------------
//         Example 3
//---------------------------

contract C1 { 

    uint x1;

    function f() virtual public view returns (uint) {
        return x1;
    } 
}


contract C2 is C1 {

    uint x2;

    function f() virtual public view override returns (uint) {
        return x2;
    } 
}


contract C3 is C1 {

    uint x3;

    function f() virtual public view override returns (uint) {
        return x3;
    } 
}


// No explicit override required
contract C4 is C2, C3 {

    uint x4;

    function f() public view override(C2, C3) returns (uint) {
        return x4;
    } 

}