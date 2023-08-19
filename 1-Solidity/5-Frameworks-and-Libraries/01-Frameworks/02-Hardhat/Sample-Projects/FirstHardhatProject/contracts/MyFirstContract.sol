// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;
contract MyFirstContract {

    uint256 number;

    function setNumber(uint256 _num) public {
        number = _num;
    }

    function getNumber() public view returns (uint256){
        return number;
    }
}