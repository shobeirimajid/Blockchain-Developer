// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Account {

    address public owner;
    address public creator;

    constructor(address _owner) payable {
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

    constructor() payable {}

    mapping(address => bytes) public codes;
    address[] public accounts;

    event Deployed(address addr, bytes32 salt);


    // the new contract's address can be pre-computed
    function create2BySalt(bytes32 salt, address arg) public returns(address createdAdr) {

        // pre-compute the address
        address predictedAdr = 

            address(
                uint160(
                    uint(
                        keccak256(
                            abi.encodePacked(
                                bytes1(0xff),
                                address(this),
                                salt,
                                keccak256(
                                    abi.encodePacked(
                                        type(Account).creationCode,
                                        abi.encode(arg)
                                    )
                                )
                            )
                        )
                    )
                )
            );

        Account d = new Account{salt: salt}(arg);
        createdAdr = address(d);

        require(createdAdr == predictedAdr);

        accounts.push(createdAdr);
        codes[createdAdr] = createdAdr.code;

        emit Deployed(address(d), salt);
        
        return createdAdr;
    }


    function destroyAccount(address payable account) public {
        Account(account).destroy(payable(address(this)));
    }

    receive() external payable {}
    fallback() external payable {}
}



/*
    bytes32 salt
    0x1234567812345678123456781234567812345678123456781234567812345678
*/