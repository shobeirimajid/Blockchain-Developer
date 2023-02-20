// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Base {

    modifier foo() virtual {
        _;
    }
}

contract Inherited is Base {

    modifier foo() override {
        _;
    }
}



/// In case of multiple inheritance, all direct base contracts must be specified explicitly:



contract A {
    modifier foo() virtual {
        _;
    }
}

contract B {
    modifier foo() virtual {
        _;
    }
}

contract C is A, B {
    modifier foo() override(A, B) {
        _;
    }
}