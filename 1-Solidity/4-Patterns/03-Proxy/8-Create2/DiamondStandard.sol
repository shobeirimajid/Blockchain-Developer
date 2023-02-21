/*
  ---------------------------------------------
  Metamorphosis Smart Contracts using CREATE2
  ---------------------------------------------
  https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/12-metamorphosis-create2/

  So far, all of the Smart Contracts are linking a Proxy to another Smart Contract through delegatecall. 
  So the proxy address stays constant and all calls are forwarded from (or executed in scope of) the Proxy.

  What if there was a way to replace a Smart Contract all-together?

  Turns out, there is! 
  It's called "Metamorphosis Smart Contracts" and feels a bit like this:

  With this solution :
    you deploy a Smart Contract 
      that deploys a Smart Contract 
        that replaces its own bytecode with another Smart Contract. 
        
    So, like Jim talks to Scotty to beam stuff around. 
    Let's see how that works.

  ---------------
  Very low level
  ---------------
  Attention, we're going very low level here now. 
  It's super advanced stuff, 
  it might take some time to fully grasp the full details of what we're doing here. 
  I will try my best to go as detailed as possible on the underlaying architecture.


  ------------------------------
  How CREATE2 works - A Primer
  ------------------------------
  A quick primer on how CREATE2 works. 
  CREATE2 is an assembly op-code for Solidity to create a Smart Contract on a specific address. 
  CREATE2 has a cool advantage: This address is known in advance.

  The address of Smart Contracts is normally created by taking  :
    - deployersAddress and 
    - nonce

  The nonce is ever increasing, but with CREATE2 there's no nonce, instead a salt. 
  The salt can be defined by the user.

  So, you can know the address of a Smart Contract in advance. 

  CREATE2 has the following specification:

    keccak256(0xff ++ deployersAddr ++ salt ++ keccak256(bytecode))[12:]

      1-  0xFF, a constant
      2-  the address of the deployer, so the Smart Contracts address that sends the CREATE2
      3-  A random salt
      4-  And the hashed bytecode that will be deployed on that particular address

    this will give you the address where the new Smart Contract is deployed.

    Let's try this:

    First, we need a factory contract that deploys contracts:
*/




//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

contract Factory {

  event Deployed(address _addr);

  function deploy(uint salt, bytes calldata bytecode) public {

    bytes memory implInitCode = bytecode;
    address addr;

    assembly {
        let encoded_data := add(0x20, implInitCode) // load initialization code.
        let encoded_size := mload(implInitCode)     // load init code's length.
        addr := create2(0, encoded_data, encoded_size, salt)
    }

    emit Deployed(addr);
  }

}




/*
  That's hopefully fairly straight forward: 
    When a new contract is deployed we emit the address as event.
    And then we can use this to deploy other smart contracts. 
    The address at which the Smart Contracts get deployed is deterministic. 
    That's what EIP-1014 says.

    keccak256( 0xff ++ address ++ salt ++ keccak256(init_code))[12:]

    Miguel Mota did a great job in writing a single function that computes the address for CREATE2. 
      https://github.com/miguelmota/solidity-create2-example
    But we're not using this, we do it step by step!

    First, let's deploy the following Smart Contract with the Factory. Add it into the existing file.


    contract NoConstructor {
        uint public myUint = 5;
    }

    Then head over to the Solidity Compiler, 
    copy the Bytecode from the Web3-create. 
    Make sure you selected the correct Contract:

    Then head over to the Deploy tab, 
    deploy the Factory first and then use the bytecode to deploy the NoConstructor Contract with Create2.

    The salt is currently a number, 
    you can start with any number, 
    I am starting with 1. 
    
    It's used to determine the final contracts address. 
    The bytecode is simply the bytecode we copied from before. 
    
    Hit "transact" and open the Transaction details. 
    It should show you the address of your newly deployed NoConstructor contract via the Factory contract:

    How to calculate this address in advance? 
    Very easy! .
    We can do this directly in the console of Remix:

      factoryAddress = "ENTER_FACTORY_ADDRESS"
      bytecode = "0x6080604052600560005534801561001557600080fd5b5060b3806100246000396000f3fe6080604052348015600f57600080fd5b506004361060285760003560e01c806306540f7e14602d575b600080fd5b60336047565b604051603e9190605a565b60405180910390f35b60005481565b6054816073565b82525050565b6000602082019050606d6000830184604d565b92915050565b600081905091905056fea264697066735822122019e87f67a50e9a888075265bb077e909763324a0aae35530f1359e047b40e06064736f6c63430008010033"
      salt = 1;
      "0x" + web3.utils.sha3('0xff' + factoryAddress.slice(2) + web3.eth.abi.encodeParameter('uint256',salt).slice(2).toString() + web3.utils.sha3(bytecode).slice(2).toString()).slice(-40);

      Pretty much copy and paste one line after the other. 
      The result should be the same address as was emitted by the Factory Smart Contract:

  -------------------------------------
  CREATE2 with Constructor Argument
  -------------------------------------
  How does it work with a Constructor? A little bit different. Essentially the data that the constructor gets as argument needs to be attached to the init-bytecode. Appended. Let's run an example.

  Add this to the already existing file:

  contract WithConstructor {

    address public owner;

    constructor(address _owner) {
      owner = _owner;
    }
  }

  So, if you want to deploy this Smart Contract then 
    you need to add a properly encoded address at the end of it. 

    How to encode the address?

      - First, copy the address from the address dropdown. 
      Then type in the console web3.eth.abi.encodeParameter('address', "THE_ADDRESS")

      - Then copy the output, but remove the starting "0x" 
      and append it to the bytecode that you are deploying using the Factory contract.

  So, now interact with the Smart Contract:

  It should output the address that was given in the constructor.

  Well, great, now you know how to deploy Smart Contracts using a CREATE2 op-code. 
  The problem is, you can't change the bytecode, 
  because the hash of the bytecode is used to create the new contract address, right?

  WRONG! (I think you knew that there was a way...)

  --------------------------------
  Overwriting Smart Contracts
  --------------------------------

  SELFDESTRUCT Removal
    The overwrite function needs to selfdestruct a Smart Contract to work. 
    This might be removed in upcoming Protocol Upgrades

  The idea is to deploy a smart contract that, upon deployment, 
  replaces its own bytecode with a different bytecode. 
  So, the bytecode you run through CREATE2 is always the same, 
  and that calls back to the Factory and replaces itself during deployment.


   dangerous!  

   Let's give it a try. 
   The full example can be found here,
    https://github.com/0age/metamorphic, 
    I am running a minimal example here for you to understand what's going on under the hood!
*/


