
/*
    ---------------------
     Function Selector
    ---------------------

        When a function is called, the first "4 bytes" of "calldata" specifies "which function" to call.
        This "4 bytes" is called a "function selector".

        Example:

            addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))

            It uses call to execute transfer on a contract at the address addr.
            The first 4 bytes returned from abi.encodeWithSignature(....) is the function selector.

        you can save a tiny amount of gas if  
            precompute and inline the function selector in your code.

        --------------------------------------------------------------------
        funcSignature                                   function Selector
        --------------------------------------------------------------------
        "transfer(address,uint256)"                     0xa9059cbb
        "transferFrom(address,address,uint256)"         0x23b872dd
        --------------------------------------------------------------------
*/



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

interface IERC20 {
    function transfer(address, uint256) external;
}

contract FunctionSelector {


    function encodeWithSignature() external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)");
    }

    function getSelector(string calldata funcSignature) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(funcSignature)));
    }

    function getSelector() external pure returns (bytes4) {
        return bytes4(keccak256(bytes("transfer(address,uint256)")));
    }

    function getSelector2() external pure returns (bytes4) {
        return IERC20.transfer.selector;
    }
}