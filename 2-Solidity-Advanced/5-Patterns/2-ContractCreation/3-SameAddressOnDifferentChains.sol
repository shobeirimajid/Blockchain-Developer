/**
    eth-deploy-crosschain
        https://github.com/shobeirimajid/eth-deploy-crosschain
        https://github.com/shobeirimajid/eth-deploy-crosschain#eth-deploy-crosschain
        https://github.com/shobeirimajid/solidity-create2-deployer
        https://github.com/shobeirimajid/eth-create2-calculator
*/



/*
    function create2BySaltAndCode(bytes memory code, bytes32 salt) public {
        address payable addr;
        assembly {
            addr := create2(0, add(code, 0x20), mload(code), salt)
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }
        emit Deployed(addr, salt);
    }

    [revert]
    The transaction has been reverted to the initial state.
    Note: The "called function" should be "payable" if you "send value" and the "value you send" should be less than your "current balance".
    "Debug" the "transaction" to get more information.

*/