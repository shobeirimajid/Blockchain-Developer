/*
    ---------------------------------------------
    Metamorphosis Smart Contracts using CREATE2
    ---------------------------------------------
    "Metamorphosis Smart Contracts" is a solution with it 
    you can deploy a Smart Contract that deploys a Smart Contract that replaces its own bytecode with another Smart Contract.
    So, like Jim talks to Scotty to beam stuff around. 
    
    ------------------------
    How CREATE2 works - A Primer
    ------------------------
    A quick primer on how CREATE2 works. 
    CREATE2 is an assembly op-code for Solidity to create a Smart Contract on a specific address. 

    CREATE2 has a cool advantage: 
        This address is known in advance.

    The address of Smart Contracts is normally created by taking the "deployersAddress" and the "nonce". 
    The nonce is ever increasing, 
    
        but with CREATE2 there's no nonce, instead a salt. 

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

    That's hopefully fairly straight forward: 
        When a new contract is deployed we emit the address as event.

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

    1-Compile the "NoConstructor" contract 
    2-Then head over to the Solidity Compiler and open the "Compilation Details"
    3-Open the Web3deploy section and copy the data field(Bytecode)  
    4-Then head over to the Deploy tab and deploy the Factory Contract 
    5-Then call deploy() function and give the salt and bytecode to deploy the NoConstructor Contract with Create2.

        The salt is currently a number, you can start with any number, I am starting with 1. 
        It's used to determine the final contracts address. 
        
        The bytecode is simply the bytecode we copied from before. 
    
    6-Hit "transact" and open the Transaction details. 
        It should show you the address of your newly deployed NoConstructor contract via the Factory contract:
        0x80649a64283d2a77f98d6f1c69d47805837dcd28

    How to calculate this address in advance? 
    Very easy! 
    We can do this directly in the console of Remix.
    Just copy and paste one line after the other. 


        *   factoryAddress = "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3"
        *   bytecode = "0x608060405234801561001057600080fd5b5061024f806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c806361ff715f14610030575b600080fd5b61004a60048036038101906100459190610144565b61004c565b005b600082828080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f82011690508083019250505050505050905060008160200182518681836000f5925050507ff40fcec21964ffb566044d083b4073f29f7f7929110ea19e1b3ebe375d89055e816040516100d691906101ab565b60405180910390a15050505050565b60008083601f8401126100f757600080fd5b8235905067ffffffffffffffff81111561011057600080fd5b60208301915083600182028301111561012857600080fd5b9250929050565b60008135905061013e81610202565b92915050565b60008060006040848603121561015957600080fd5b60006101678682870161012f565b935050602084013567ffffffffffffffff81111561018457600080fd5b610190868287016100e5565b92509250509250925092565b6101a5816101c6565b82525050565b60006020820190506101c0600083018461019c565b92915050565b60006101d1826101d8565b9050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b61020b816101f8565b811461021657600080fd5b5056fea264697066735822122014dbae95e9ef8cdff9997e5eb9c359ebfc9d63f7afa966535d0f9fd20134d6b664736f6c63430008010033"
        *   salt = 1;
        *   "0x" + web3.utils.sha3('0xff' + factoryAddress.slice(2) + web3.eth.abi.encodeParameter('uint256',salt).slice(2).toString() + web3.utils.sha3(bytecode).slice(2).toString()).slice(-40);

                -> 0xdb46dc8ccba2ec2c72aae179e3169fe8ddc48ba8

    The result should be the same address as was emitted by the Factory Smart Contract:

        0xdB46dc8cCba2ec2c72Aae179E3169fe8DDc48Ba8


    ----------------------------------------
    CREATE2 with Constructor Argument
    ----------------------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/12-metamorphosis-create2/#create2-with-constructor-argument

    How does it work with a Constructor? 
    A little bit different. 
    Essentially the data that the constructor gets as argument needs to be attached to the init-bytecode. 
    Appended. Let's run an example.

    Add this to the already existing file:


        contract WithConstructor {
            address public owner;

            constructor(address _owner) {
                owner = _owner;
            }
        }


    So, if you want to deploy this Smart Contract

        you need to add a properly "encoded address" at the end of it. 
        How to encode the address?

        1-Compile the "WithConstructor" contract 
        2-Then head over to the Solidity Compiler and open the "Compilation Details"
        3-Open the Web3deploy section and copy the data field(Bytecode) 
            0x608060405234801561001057600080fd5b5061024f806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c806361ff715f14610030575b600080fd5b61004a60048036038101906100459190610144565b61004c565b005b600082828080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f82011690508083019250505050505050905060008160200182518681836000f5925050507ff40fcec21964ffb566044d083b4073f29f7f7929110ea19e1b3ebe375d89055e816040516100d691906101ab565b60405180910390a15050505050565b60008083601f8401126100f757600080fd5b8235905067ffffffffffffffff81111561011057600080fd5b60208301915083600182028301111561012857600080fd5b9250929050565b60008135905061013e81610202565b92915050565b60008060006040848603121561015957600080fd5b60006101678682870161012f565b935050602084013567ffffffffffffffff81111561018457600080fd5b610190868287016100e5565b92509250509250925092565b6101a5816101c6565b82525050565b60006020820190506101c0600083018461019c565b92915050565b60006101d1826101d8565b9050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b61020b816101f8565b811461021657600080fd5b5056fea264697066735822122014dbae95e9ef8cdff9997e5eb9c359ebfc9d63f7afa966535d0f9fd20134d6b664736f6c63430008010033

        4-Copy the address from the address dropdown. Then type in the console:

            web3.eth.abi.encodeParameter('address', "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
            -> 0x0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4

        5-Then copy the output AND remove the starting "0x" 
            -> 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4

        6- append it to the bytecode that you are deploying using the Factory contract.
            -> 0x608060405234801561001057600080fd5b5061024f806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c806361ff715f14610030575b600080fd5b61004a60048036038101906100459190610144565b61004c565b005b600082828080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f82011690508083019250505050505050905060008160200182518681836000f5925050507ff40fcec21964ffb566044d083b4073f29f7f7929110ea19e1b3ebe375d89055e816040516100d691906101ab565b60405180910390a15050505050565b60008083601f8401126100f757600080fd5b8235905067ffffffffffffffff81111561011057600080fd5b60208301915083600182028301111561012857600080fd5b9250929050565b60008135905061013e81610202565b92915050565b60008060006040848603121561015957600080fd5b60006101678682870161012f565b935050602084013567ffffffffffffffff81111561018457600080fd5b610190868287016100e5565b92509250509250925092565b6101a5816101c6565b82525050565b60006020820190506101c0600083018461019c565b92915050565b60006101d1826101d8565b9050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b61020b816101f8565b811461021657600080fd5b5056fea264697066735822122014dbae95e9ef8cdff9997e5eb9c359ebfc9d63f7afa966535d0f9fd20134d6b664736f6c634300080100330000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4

        7-Head over to the Deploy tab and deploy the Factory Contract 

        8-Call deploy() function and give the salt and bytecode to deploy the NoConstructor Contract with Create2.

            The salt is currently a number, you can start with any number, I am starting with 1. 
            It's used to determine the final contracts address. 
            
            The bytecode is simply the bytecode we copied from before. 
        
        6-Hit "transact" and open the Transaction details. 
            It should show you the address of your newly deployed NoConstructor contract via the Factory contract:
            0x8a1451BCdDFeb21Fe97b7291943645fE0971978B
            

        *   factoryAddress = "0x0fC5025C764cE34df352757e82f7B5c4Df39A836"
        *   bytecode = "0x608060405234801561001057600080fd5b5061024f806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c806361ff715f14610030575b600080fd5b61004a60048036038101906100459190610144565b61004c565b005b600082828080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f82011690508083019250505050505050905060008160200182518681836000f5925050507ff40fcec21964ffb566044d083b4073f29f7f7929110ea19e1b3ebe375d89055e816040516100d691906101ab565b60405180910390a15050505050565b60008083601f8401126100f757600080fd5b8235905067ffffffffffffffff81111561011057600080fd5b60208301915083600182028301111561012857600080fd5b9250929050565b60008135905061013e81610202565b92915050565b60008060006040848603121561015957600080fd5b60006101678682870161012f565b935050602084013567ffffffffffffffff81111561018457600080fd5b610190868287016100e5565b92509250509250925092565b6101a5816101c6565b82525050565b60006020820190506101c0600083018461019c565b92915050565b60006101d1826101d8565b9050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b61020b816101f8565b811461021657600080fd5b5056fea264697066735822122014dbae95e9ef8cdff9997e5eb9c359ebfc9d63f7afa966535d0f9fd20134d6b664736f6c634300080100330000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4"
        *   salt = 1;
        *   "0x" + web3.utils.sha3('0xff' + factoryAddress.slice(2) + web3.eth.abi.encodeParameter('uint256',salt).slice(2).toString() + web3.utils.sha3(bytecode).slice(2).toString()).slice(-40);

                -> 0x8a1451bcddfeb21fe97b7291943645fe0971978b


    To interact with the newly Deployed Smart Contract:

        1-Head over to the Deploy tab 
        2-Select contract "WithConstructor"
        3-Put the newly Deployed Contract's address into the "At Address" field.
        4-Click on Owner button on opened contract.
            It should output the address that was given in the constructor.


    Well, great, now you know how to deploy Smart Contracts using a CREATE2 op-code. 
    The problem is, you can't change the bytecode, 
    because the hash of the bytecode is used to create the new contract address, right?


    But as a fact of matter, that there was a way !!!!!!


    ----------------------------------------
    Overwriting Smart Contracts
    ----------------------------------------
    SELFDESTRUCT Removal

    The overwrite function needs to selfdestruct a Smart Contract to work. 

        -------------------------------------------------------------------
            !!! This might be removed in upcoming Protocol Upgrades !!!
        -------------------------------------------------------------------

    The idea is to deploy a smart contract that, 
        upon deployment, replaces its own bytecode with a different bytecode. 
    
    So, the bytecode you run through CREATE2 is always the same, 
    and that calls back to the Factory and replaces itself during deployment.

    And dangerous!

    
        ------------------------------------------------------------------------------------------------------------
            The full example can be found here:
            https://github.com/0age/metamorphic

        Metamorphic - A factory contract for creating metamorphic (i.e. redeployable) contracts.
        This factory contract creates "metamorphic contracts"
        "metamorphic contracts" : contracts that can be redeployed with new code to the same address.
        ------------------------------------------------------------------------------------------------------------


    Let's give it a try. 

    I am running a minimal example here for you to understand what's going on under the hood!
        see the "ex5-Metamorphosis.sol"


    What does it do? 
    
    If you look through the code, it just deploys a contract that does only two things: 

        1. Call back the msg.sender and inquire an address. 
        2. Copy the bytecode running on that address over its own bytecode

     then that's exactly what it does.


    How do you use it?

        1-Deploy the Factory
        2-use Test1 bytecode with salt=1 to deploy the Test1.
        3-Tell Remix that Test1 runs on the address of the Metamorphic contract
        4-Set the "myUint" to whatever value you want, it works
        5-Kill Test1
        6-Deploy Test2 bytecode using the same salt=1
            It will deploy a different bytecode to the same address!!!
            Get comfortable that setUint now doubles the input amount.
            Imagine what this does with a Token Contract you thought it safe to use.


    Now imagine for a moment that this is a token contract. 
    Or a new shiny DeFi Project. 
    Imagine people start investing, and suddenly the contract logic changes. 
    All the trust you put into Blockchain is lost. 

    How to avoid getting scammed here? 
    
    First look for a selfdestruct functionality. 
    If it has one, then it's necessary to follow the whole chain of deployers 
    and see if one used the create2 opcode. 
    If yes, then further investigate what they deployed. 
    If it's a Metamorphic Smart Contract, then you know that something fishy is going on...

*/