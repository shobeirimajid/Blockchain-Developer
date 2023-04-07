//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;


contract Factory {

    mapping (address => address) _implementations;
    event Deployed(address _addr);


    function deploy(uint salt, bytes calldata bytecode) public {

        //-------------------------------------------------------------------------------
        // 1- deploy the implementation code that we want to be deployed on a separate address
        //-------------------------------------------------------------------------------

        // assign the implementation code for the new contract.
        bytes memory implementationInitCode = bytecode;

        // declare a variable for the address of the implementation contract.
        address implementationContract;

        // load implementation init code and length, then deploy via CREATE.
        assembly {

          let encoded_data := add(0x20, implementationInitCode)     // load initialization code.
          let encoded_size := mload(implementationInitCode)         // load init code's length.

          implementationContract := create(                         // call CREATE with 3 arguments.
            0,                                                      // do not forward any endowment.
            encoded_data,                                           // pass in initialization code.
            encoded_size                                            // pass in init code's length.
          )

        }



        //---------------------------------------------------------------------------------------------
        // 2- store the implementation to be retrieved by the metamorphic contract.
        //---------------------------------------------------------------------------------------------

        //---------------------------------------------------------------------------------------------
        //
        //                                      ::::::::::::::
        //                                      ::   NOTE   ::
        //                                      ::::::::::::::
        //
        // https://github.com/0age/metamorphic/blob/master/contracts/MetamorphicContractFactory.sol#L53
        // Metamorphic contract initialization code (29 bytes): 
        // 0x5860208158601c335a63aaf10f428752fa158151803b80938091923cf3

        // assign the initialization code for the metamorphic contract.
        bytes memory metamorphicCode = (hex"5860208158601c335a63aaf10f428752fa158151803b80938091923cf3");

        // the address of the metamorphic contract.
        address metamorphicContractAddress = _getMetamorphicContractAddress(salt, metamorphicCode);

        _implementations[metamorphicContractAddress] = implementationContract;



        //-------------------------------------------------------------------------------
        // 3- deploy the metamorphic code 
        //-------------------------------------------------------------------------------

        // declare a variable for the address of the metamorphic contract.
        address addr;

        // load metamorphic code and length, then deploy via CREATE2.
        assembly {

            let encoded_data := add(0x20, metamorphicCode) // load initialization code.
            let encoded_size := mload(metamorphicCode)     // load init code's length.

            addr := create2(
                0, 
                encoded_data, 
                encoded_size, 
                salt
            )

        }

        require(addr == metamorphicContractAddress,"Failed to deploy the new metamorphic contract.");

        emit Deployed(addr);
    }



    /**
    * @dev Internal view function for calculating a metamorphic contract address
    * given a particular salt and ByteCode of metamorphic contract.
    */
    function _getMetamorphicContractAddress(uint256 salt, bytes memory metamorphicCode) internal view returns (address) {

        // determine the address of the metamorphic contract.
        return address(
            uint160(                                // downcast to match the address type.
                uint256(                            // convert to uint to truncate upper digits.
                    keccak256(                      // compute the CREATE2 hash using 4 inputs.
                        abi.encodePacked(           // pack all inputs to the hash together.
                            hex"ff",                // start with 0xff to distinguish from RLP.
                            address(this),          // this contract will be the caller.
                            salt,                   // pass in the supplied salt value.
                            keccak256(
                                abi.encodePacked(
                                    metamorphicCode
                                )
                            ) // the init code hash.
                        )
                    )
                )
            )
        );
    }



    // this function is getting called by the metamorphic Contract
    function getImplementation() external view returns (address implementation) {
        return _implementations[msg.sender];
    }

}



contract Test1 {
    uint public myUint;

    function setUint(uint _myUint) public {
        myUint = _myUint;
    }

    function killme() public {
        selfdestruct(payable(msg.sender));
    }
}



contract Test2 {
    uint public myUint;

    function setUint(uint _myUint) public {
        myUint = 2*_myUint;
    }

    function killme() public {
        selfdestruct(payable(msg.sender));
    }
}