// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


library Math {

    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (default value)
    }
}



contract TestMath {

    function testSquareRoot(uint x) public pure returns (uint) {
        return Math.sqrt(x);
    }
}