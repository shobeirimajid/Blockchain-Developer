// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Account {

    address public owner;
    address public creator;

    constructor(address _owner) {
        owner = _owner;
        creator = msg.sender;
    }

    function changeOwner(address _owner) public {
        require(msg.sender == owner);
        owner = _owner;
    }

    function destroy(address recipient) public {
        require(msg.sender == creator);
        selfdestruct(payable(recipient));
    }

    receive() payable external {}
    fallback() payable external {}
    
}


contract Factory {

    mapping(address => bytes) public codes;
    address[] public accounts;

    event Deployed(address addr, uint256 salt);


    function create2BySalt(bytes32 salt, address arg) public returns(address createdAdr) {

        // This complicated expression just tells you how the address can be pre-computed. 
        address predictedAdr = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                type(Account).creationCode,
                abi.encode(arg)
            ))
        )))));

        Account d = new Account{salt: salt}(arg);

        require(address(d) == predictedAdr);

        accounts.push(address(d));
        codes[address(d)] = address(d).code;

        return predictedAdr;
    }


    function create2BySaltAndCode(bytes memory code, uint256 salt) public {
        address addr;
        assembly {
            addr := create2(0, add(code, 0x20), mload(code), salt)
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }

        emit Deployed(addr, salt);
    }


    function destroyAccount(address payable account) public {
        Account(account).destroy(payable(address(this)));
    }

    receive() payable external {}
    fallback() payable external {}


}



/*
    0x1234567812345678123456781234567812345678123456781234567812345678

*/