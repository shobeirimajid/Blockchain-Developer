//SPDX-License-Identifier: No-Idea!
pragma solidity 0.8.1;
import "./Upgradeable.sol";

contract Example is Upgradeable {
    uint _value;

    function initialize() override public {
        _sizes[bytes4(keccak256("getUint()"))] = 32;
    }

    function getUint() public view returns (uint) {
        return _value*2;
    }

    function setUint(uint value) public {
        _value = value;
    }
}