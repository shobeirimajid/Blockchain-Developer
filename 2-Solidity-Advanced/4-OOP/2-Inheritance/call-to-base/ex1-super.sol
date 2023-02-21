// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


/* 
      Inheritance tree

             A
           /   \
           B   C
            \ /
             D

    Parent contracts can be called :
        1- directly                 B.foo()                    
        2- by keyword "super"       super.foo()

    By using the keyword "super"  --->   all of the immediate parent contracts will be called
*/



contract A {

    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}



contract B is A {

    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}



contract C is A {

    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}



contract D is B, C {

    /*
        it only called C and then A
        Although D inherits A,B,C
    */

    function foo() public override(B, C) {
        super.foo();
    }



    /*
        it called C, then B, and finally A
        Although super was called twice (by B and C) it only called A once.
    */

    function bar() public override(B, C) {
        super.bar();
    }
}