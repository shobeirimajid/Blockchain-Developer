// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";


contract CloneFactory {
 
    function createClone(address target) internal returns (address result) {

        // convert address to 20 bytes
        bytes20 targetBytes = bytes20(target);

        // actual code
        // 3d602d80600a3d3981f3363d3d373d3d3d363d73bebebebebebebebebebebebebebebebebebebebe5af43d82803e903d91602b57fd5bf3

        // creation code
        // copy runtime code into memory and return it
        // 3d602d80600a3d3981f3

        // runtime code
        // code to delegatecall to address
        // 363d3d373d3d3d363d73 address 5af43d82803e903d91602b57fd5bf3


        assembly {

            /*
                In solidity,
                The '0x40' slot in memory is special: 
                it contains the "free memory pointer"
                which points to the "end of the currently allocated memory"
            */

            // reads the 32 bytes of memory starting at pointer stored in 0x40
            let clone := mload(0x40)

            // store 32 bytes to memory starting at "clone"
            mstore(
                clone,
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
            )

            /*
                |              20 bytes                  |
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
                                                          ^
                                                          pointer
            */

            // store "32 bytes" targetBytes to memory starting at "clone + 20 bytes"
            // 0x14 = 20
            mstore(
                add(clone, 0x14), 
                targetBytes
            )

            /*
                |               20 bytes                 |                 20 bytes              |
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73bebebebebebebebebebebebebebebebebebebebe
                                                                                                  ^
                                                                                                  pointer
            */

            // store "32 bytes" to memory starting at "clone + 40 bytes"
            // 0x28 = 40
            mstore(
                add(clone, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )

            /*
                |               20 bytes                 |                 20 bytes              |           15 bytes          |
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73bebebebebebebebebebebebebebebebebebebebe5af43d82803e903d91602b57fd5bf3
                
            */

            result := create(   // create(v, p, n) - create new contract
                0,              // v = amount of ETH to send (0)
                clone,          // p = pointer in memory to start of code (clone)
                0x37            // n = size of code (0x37 ~ 55 bytes)
            )
        }
    }

}



// library contract
contract libraryContract {

    /*function init(address _thing, string memory _name, uint _value) public returns (bool status, bytes memory result) {
        bytes memory data = abi.encodeWithSignature("init(address,uint)", _name, _value);
        (status, result) = _thing.delegatecall(data);
        require(status, "call failed");
    }*/

    string public name; 
    uint public value;

    function init(string memory _name, uint _value) public {
        name = _name;
        value = _value;
    }
}



// master contract
contract Thing is Ownable {

    string public name; 
    uint public value;

    address public libraryAddress;

    function setLibraryAddress(address _libraryAddress) public onlyOwner {
        libraryAddress = _libraryAddress;
    }

    /*constructor(string memory _name, uint _value) {
        name = _name;
        value = _value;
    }*/

    /*function init(string memory _name, uint _value) public {
        name = _name;
        value = _value;
    }*/

    function init(string memory _name, uint _value) public returns (bool status, bytes memory result) {
        bytes memory data = abi.encodeWithSignature("init(address,uint)", _name, _value);
        (status, result) = libraryAddress.delegatecall(data);
        require(status, "call failed");
    }

}



/* 
    implementor factory contract
        This will inexpensively create a mimimalist 'forwarding shim' contract 
        that will delegate all calls to the contract libraryAddress

    WARNINGS
        (1) Be sure that the master contract is pre-initialized. 
            You can usually accomplish this in your constructor 
            as the only time the master contract constructor is called is during the master contract's creation. 
            Clone contracts do not call the constructor, 
            but are initialized with an inline initialization method.

        (2) Do not allow your master contract to be self-destructed 
            as it will cause all clones to stop working, 
            thus freezing their state and balances.
*/

contract ThingFactory is Ownable, CloneFactory {

  address public libraryAddress;
  event ThingCreated(address newThingAddress);

  constructor(address _libraryAddress) {
    libraryAddress = _libraryAddress;
  }


  function setLibraryAddress(address _libraryAddress) public onlyOwner {
    libraryAddress = _libraryAddress;
  }


  function createThing(string memory _name, uint _value) public onlyOwner {

    address clone = createClone(libraryAddress);

    Thing(clone).init(_name, _value);

    emit ThingCreated(clone);
  }

}



contract Helper {

    /*function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }*/


    /*function getBytecode2(uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }*/

    function getCalldata(string memory _name, uint _value) external pure returns (bytes memory) {
        return abi.encodeWithSignature("init(address,uint)", _name, _value);
    }
}




/*
    ---------------------------
    Minimal Proxy Contract
    ---------------------------
    If you have a contract that will be deployed multiple times, 
        use 'minimal proxy' contract to deploy them cheaply.

    Original code
        Simple clone contract factory
        https://github.com/optionality/clone-factory/blob/master/contracts/CloneFactory.sol
        
        Check out the contracts/CloneFactory.sol file for details.
        https://github.com/optionality/clone-factory/blob/master/contracts/CloneFactory.sol

        This code (intended to be called from an implementor factory contract)  
        will allow you to install a 'master copy of a contract'
        then easily (cheaply) create clones with separate state.
        The 'deployed bytecode' just 'delegates' all calls to the 'master contract' address


        1-Deploy Library Contract
            0x1c91347f2A44538ce62453BEBd9Aa907C662b4bD

        2-Deploy ThingFactory contract

        3-call ThingFactory.setLibraryAddress(_libraryAddress)

        3-Call ThingFactory.createThing(name, value)
            clone contract address:
            0x8dF5FC7AfF228ABa3F0fcf0433B421C4647beBEd
*/