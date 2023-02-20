// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;


contract X {}


contract A is X {}


/*
    This will not compile
    The reason for this is that:

        C requests X to override A (by specifying A, X in this order), 
        but A itself requests to override X
    
    which is a contradiction that cannot be resolved.


*/

// contract C is A, X {}






/*
    when there are multiple constructors in the inheritance hierarchy
      inheritance linearization is important 

    The constructors will always be executed in the linearized order,
      regardless of the order in which their arguments are provided in the inheriting contract’s constructor. 
*/


contract Base1 {
    constructor() {}
}

contract Base2 {
    constructor() {}
}


/*
    Constructors are executed in the following order:
        1- Base1
        2- Base2
        3- Derived1
*/
contract Derived1 is Base1, Base2 {
    constructor() Base1() Base2() {

    }
}


/*
    Constructors are executed in the following order:
        1- Base2
        2- Base1
        3- Derived2
*/
contract Derived2 is Base2, Base1 {
    constructor() Base2() Base1() {}
}


/*
    Constructors are still executed in the following order:
    1- Base2
    2- Base1
    3- Derived3
*/
contract Derived3 is Base2, Base1 {
    constructor() Base1() Base2() {}
}
