// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;
contract MyFirstContract {

    string str;

    function setMessage(string memory _str) public {
        str = _str;
    }

    function getMessage() public view returns (string memory){
        return str;
    }
}