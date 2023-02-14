//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

// Storage contract 
// remains a constant and isn't changed at all

contract ExternalStorage {

    mapping(bytes32 => uint) UIntStorage;
    mapping(bytes32 => bool) BooleanStorage;

    function getUIntValue(bytes32 record) public view returns (uint) {
        return UIntStorage[record];
    }

    function setUIntValue(bytes32 record, uint value) public {
        UIntStorage[record] = value;
    }

    function getBooleanValue(bytes32 record) public view returns (bool) {
        return BooleanStorage[record];
    }

    function setBooleanValue(bytes32 record, bool value) public {
        BooleanStorage[record] = value;
    }
}