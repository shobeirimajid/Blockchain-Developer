// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;


contract C {
    uint private data;

    function f(uint a) private pure returns(uint b) { return a + 1; }
    function setData(uint a) public { data = a; }
    function getData() public view returns(uint) { return data; }
    function compute(uint a, uint b) internal pure returns (uint) { return a + b; }
}


// This will not compile
contract D {
    function readData() public {

        C c = new C();

        uint local1 = c.f(7);           // error: member `f` is not visible / f is private
        c.setData(3);
        uint local2 = c.getData();
        uint local3 = c.compute(3, 5);  // error: member `compute` is not visible / compute() is internal
    }
}


contract E is C {

    function g() public {

        C c = new C();

        uint local = c.f(7);            // error: member `f` is not visible / f is private
        uint val = compute(3, 5);       // access to internal member (from derived to parent contract)
        
    }
}



/*

    In the abowe example

        D can call c.getData()          - getData() is public
        D is not able to call c.f()     - f() is private
        
    E is derived from C, thus

        E can call c.compute()          - compute() is internal and is visisble to drived contracts
        D is not able to call c.f()     - f() is private and is not visible to anyone

*/