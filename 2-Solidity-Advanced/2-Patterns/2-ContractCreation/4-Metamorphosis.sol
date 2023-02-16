/*
    ---------------------------------------------
    Metamorphosis Smart Contracts using CREATE2
    ---------------------------------------------
    "Metamorphosis Smart Contracts" is a solution with it 
    you can deploy a Smart Contract that deploys a Smart Contract that replaces its own bytecode with another Smart Contract.
    So, like Jim talks to Scotty to beam stuff around. 
    
    ------------------------
    How CREATE2 works
    ------------------------
    A quick primer on how CREATE2 works. 
    CREATE2 is an assembly op-code for Solidity to create a Smart Contract on a specific address. 

    CREATE2 has a cool advantage: 
        This address is known in advance.

    The address of Smart Contracts is normally created by taking the "deployersAddress" and the "nonce". 
    The nonce is ever increasing, but with CREATE2 there's no nonce, instead a salt. 

    The "salt" can be defined by the user.
    So, you can know the address of a Smart Contract in advance. 

    CREATE2 has the following specification:

        keccak256( 0xff ++ deployersAddr ++ salt ++ keccak256(bytecode) )

        1- 0xFF, a constant
        2- the address of the deployer, so the Smart Contracts address that sends the CREATE2
        3- A random salt
        4- And the "hashed bytecode" that will be deployed on that particular address

    this will give you the "address" where the new Smart Contract is deployed.


    First, we need a "factory contract" that deploys contracts:

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

    That's hopefully fairly straight forward: When a new contract is deployed we emit the address as event.

    And then we can use this to deploy other smart contracts. 
    The address at which the Smart Contracts get deployed is deterministic. 
    That's what EIP-1014 says:
        https://eips.ethereum.org/EIPS/eip-1014
        keccak256( 0xff ++ address ++ salt ++ keccak256(init_code))[12:]


    Miguel Mota did a great job in writing a single function that computes the address for CREATE2.
        https://github.com/miguelmota/solidity-create2-example

    But we're not using this, we do it step by step!

    First, let's deploy the following Smart Contract with the Factory. 
    


    contract NoConstructor {
        uint public myUint = 5;
    }


    Add it into the existing file.

    Compile the "NoConstructor" contract 
    Then head over to the Solidity Compiler
    open the "Compilation Details"
    then open the Web3deploy section 
    and copy the data(Bytecode) field 
    Then head over to the Deploy tab, 
    deploy the Factory first 
    then use the bytecode to deploy the NoConstructor Contract with Create2.

    The salt is currently a number, 
    you can start with any number, 
    I am starting with 1. 
    It's used to determine the final contracts address. 
    The bytecode is simply the bytecode we copied from before. 
    
    Hit "transact" and open the Transaction details. 
    It should show you the address of your newly deployed NoConstructor contract via the Factory contract:
        0x80649a64283d2a77f98d6f1c69d47805837dcd28

    How to calculate this address in advance? 
    Very easy! 
    We can do this directly in the console of Remix:



    factoryAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138"
    bytecode = "0x608060405234801561001057600080fd5b5061024f806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c806361ff715f14610030575b600080fd5b61004a60048036038101906100459190610144565b61004c565b005b600082828080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f82011690508083019250505050505050905060008160200182518681836000f5925050507ff40fcec21964ffb566044d083b4073f29f7f7929110ea19e1b3ebe375d89055e816040516100d691906101ab565b60405180910390a15050505050565b60008083601f8401126100f757600080fd5b8235905067ffffffffffffffff81111561011057600080fd5b60208301915083600182028301111561012857600080fd5b9250929050565b60008135905061013e81610202565b92915050565b60008060006040848603121561015957600080fd5b60006101678682870161012f565b935050602084013567ffffffffffffffff81111561018457600080fd5b610190868287016100e5565b92509250509250925092565b6101a5816101c6565b82525050565b60006020820190506101c0600083018461019c565b92915050565b60006101d1826101d8565b9050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b61020b816101f8565b811461021657600080fd5b5056fea2646970667358221220a9aee35b4f957d9c035fbaca7f02e4516fda03d244bb65a4a6791e2b4fae8c3564736f6c63430008010033"
    salt = 1;
    "0x" + web3.utils.sha3('0xff' + factoryAddress.slice(2) + web3.eth.abi.encodeParameter('uint256',salt).slice(2).toString() + web3.utils.sha3(bytecode).slice(2).toString()).slice(-40);



    Pretty much copy and paste one line after the other. 
    The result should be the same address as was emitted by the Factory Smart Contract:
        0x80649a64283d2a77f98d6f1c69d47805837dcd28



    ------------------------
    CREATE2 with Constructor Argument
    ------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/12-metamorphosis-create2/#create2-with-constructor-argument










    














*/