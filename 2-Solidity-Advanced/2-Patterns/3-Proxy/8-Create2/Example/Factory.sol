//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

contract Factory {

    mapping (address => address) _implementations;

    event Deployed(address _addr);

    function deploy(uint salt, bytes calldata bytecode) public {

        bytes memory implInitCode = bytecode;

          // assign the initialization code for the metamorphic contract.
        bytes memory metamorphicCode  = (
          hex"5860208158601c335a63aaf10f428752fa158151803b80938091923cf3"
        );

         // determine the address of the metamorphic contract.
        address metamorphicContractAddress = _getMetamorphicContractAddress(salt, metamorphicCode);

        // declare a variable for the address of the implementation contract.
        address implementationContract;


        // load implementation init code and length, then deploy via CREATE.
        /* solhint-disable no-inline-assembly */
        assembly {
          let encoded_data := add(0x20, implInitCode) // load initialization code.
          let encoded_size := mload(implInitCode)     // load init code's length.
          implementationContract := create(       // call CREATE with 3 arguments.
            0,                                    // do not forward any endowment.
            encoded_data,                         // pass in initialization code.
            encoded_size                          // pass in init code's length.
          )
        } /* solhint-enable no-inline-assembly */


        // first we deploy the code we want to deploy on a separate address
        // store the implementation to be retrieved by the metamorphic contract.
        _implementations[metamorphicContractAddress] = implementationContract;

        address addr;
        assembly {
            let encoded_data := add(0x20, metamorphicCode) // load initialization code.
            let encoded_size := mload(metamorphicCode)     // load init code's length.
            addr := create2(0, encoded_data, encoded_size, salt)
        }

        require(addr == metamorphicContractAddress, "Failed to deploy the new metamorphic contract.");
        emit Deployed(addr);
    }


    /**
    * @dev Internal view function for calculating a metamorphic contract address
    * given a particular salt.
    */
    function _getMetamorphicContractAddress(uint256 salt, bytes memory metamorphicCode) internal view returns (address) {

        // determine the address of the metamorphic contract.
        return address(
          uint160(                      // downcast to match the address type.
            uint256(                    // convert to uint to truncate upper digits.
              keccak256(                // compute the CREATE2 hash using 4 inputs.
                abi.encodePacked(       // pack all inputs to the hash together.
                  hex"ff",              // start with 0xff to distinguish from RLP.
                  address(this),        // this contract will be the caller.
                  salt,                 // pass in the supplied salt value.
                  keccak256(
                      abi.encodePacked(
                        metamorphicCode
                      )
                    )     // the init code hash.
                )
              )
            )
          )
        );
    }


    //those two functions are getting called by the metamorphic Contract
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


/*
    What does it do? 
    It deploys a contract that does only two things: 
      1. Call back the msg.sender and inquire an address. 
      2. Copy the bytecode running on that address over its own bytecode

    If you look through the code then that's exactly what it does.

    How do you use it?
        1. Deploy the Factory
        2. use Test1 bytecode with salt=1 to deploy the Test1.
        3. Tell Remix that Test1 runs on the address of the Metamorphic contract
        4. Set the "myUint" to whatever value you want, it works
        5. Kill Test1
        6. Deploy Test2 bytecode using the same salt=1
        7. It will deploy a different bytecode to the same address!!!
        8. Get comfortable that setUint now doubles the input amount.
        9. Imagine what this does with a Token Contract you thought it safe to use.


    Now imagine for a moment that this is a token contract. 
        Or a new shiny DeFi Project. 
        Imagine people start investing, and suddenly the contract logic changes. 
        All the trust you put into Blockchain is lost. 
    
    How to avoid getting scammed here? 
    
    First look for a selfdestruct functionality. 

        If it has one, then it's necessary to follow the whole chain of deployers 
            and see if one used the create2 opcode. If yes, then further investigate what they deployed. 
            If it's a Metamorphic Smart Contract, then you know that something fishy is going on...

*/