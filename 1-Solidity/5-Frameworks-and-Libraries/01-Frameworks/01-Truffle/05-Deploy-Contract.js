////////////////////////////////////////////////
//              Deploy Contract
////////////////////////////////////////////////


//--------------------------------
//          Migration 
//--------------------------------

// Migrations are JavaScript files that help you deploy contracts to the Ethereum network. 
// These files are responsible for staging your deployment tasks, 
// and they're written under the assumption that your deployment needs will change over time. 
// As your project evolves, you'll create new migration scripts 
// to further this evolution on the blockchain. 
// A history of previously run migrations is recorded on-chain 
// through a special Migrations contract, detailed below.


// To run your migrations, run the following:
$ truffle migrate


// Specify a network
$ truffle migrate --network live




// Migration files

// var ContractOne = artifacts.require("ContractOne");
// var ContractTwo = artifacts.require("ContractTwo");
var MyContract = artifacts.require("MyContract");

module.exports = function(deployer) {
  // deployment steps
  // deployer.deploy(A);
  // deployer.deploy(B);
  deployer.deploy(MyContract);
};


// Deploy A, then deploy B, passing in A's newly deployed address
deployer.deploy(A).then(function() {
    return deployer.deploy(B, A.address);
});


// To conditionally stage deployment steps, 
// write your migrations so that they accept a second parameter, called network. 
// Example:
module.exports = function(deployer, network) {
    if (network == "live") {
      // Do something specific to the network named "live".
    } else {
      // Perform a different step otherwise.
    }
}


// Migrations are also passed the list of accounts provided to you by your Ethereum client 
// and web3 provider, for you to use during your deployments. 
// This is the exact same list of accounts returned from web3.eth.getAccounts().

module.exports = function(deployer, network, accounts) {
  // Use the accounts within your migrations.
}



// The deployer contains many functions available to simplify your migrations.
// deployer.deploy(contract, args..., options)
// Examples:

// Deploy a single contract without constructor arguments
deployer.deploy(A);

// Deploy a single contract with constructor arguments
deployer.deploy(A, arg1, arg2, ...);

// Don't deploy this contract if it has already been deployed
deployer.deploy(A, {overwrite: false});

// Set a maximum amount of gas and `from` address for the deployment
deployer.deploy(A, {gas: 4612388, from: "0x...."});

// Deploying multiple contracts as an array is now deprecated.
// This used to be quicker than writing three `deployer.deploy()` statements as the deployer
// can perform the deployment as a single batched request.
// deployer.deploy([
//   [A, arg1, arg2, ...],
//   B,
//   [C, arg1]
// ]);

// External dependency example:
//
// For this example, our dependency provides an address when we're deploying to the
// live network, but not for any other networks like testing and development.
// When we're deploying to the live network we want it to use that address, but in
// testing and development we need to deploy a version of our own. Instead of writing
// a bunch of conditionals, we can simply use the `overwrite` key.
deployer.deploy(SomeDependency, {overwrite: false});

// deployer.link(library, destinations)
// Link an already-deployed library to a contract or multiple contracts. 
// Here library can be either the library contract abstraction, 
// to link to the deployed copy, or a specific library instance if you want to link to a copy 
// at a different address. 
// The destinations argument can be a single contract or an array of multiple contracts. 
// If any contract within the destination doesn't rely on the library being linked, 
// the contract will be ignored.
// Example:
// Deploy library LibA, then link LibA to contract B, then deploy B.
deployer.deploy(LibA);
deployer.link(LibA, B);
deployer.deploy(B);

// Link LibA to many contracts
deployer.link(LibA, [B, C, D]);

// Link to a copy of LibA at a custom address
const instanceOfLibA = await LibA.at(address);
await deployer.link(instanceOfLibA, B);


// deployer.then(function() {...})
// Just like a promise, run an arbitrary deployment step.
//  Use this to call specific contract functions during your migration to add, 
// edit and reorganize contract data.

// Example:
var a, b;
deployer.then(function() {
  // Create a new version of A
  return A.new();
}).then(function(instance) {
  a = instance;
  // Get the deployed instance of B
  return B.deployed();
}).then(function(instance) {
  b = instance;
  // Set the new instance of A's address on B via B's setA() function.
  return b.setA(a.address);
});


// Migrations with async/await
module.exports = async function(deployer) {
    // deploy a contract
    await deployer.deploy(MyContract);
    //access information about your deployed contract instance
    const instance = await MyContract.deployed();
}



//--------------------------------
//      Truffle Dashboard
//--------------------------------

// In 2022, Truffle launched an awesome new feature called the Truffle Dashboard 
// that allows you to deploy your contracts using your MetaMask wallet.

// How to deploy smart contracts without having to copy-paste mnemonic phrases to a .env file?
// When we are deploying smart contracts we need to specify an Ethereum account that has enough funds to cover the transaction fees of the deployment.
// Wallets like MetaMask can handle signing messages with our account's private key and send transactions for us.

//------------------------
// What is the problem?
//------------------------
// When we are deploying smart contracts on the live networks by the command line tools,
// Ex. @truffle/hdwallet-provider
// HD-Wallet signs transactions itself without sending them to the metamask. So it needs to access our account's private key (mnemonic phrase).

//------------------------
// How to access it?
//------------------------
// The common method is copy-pasting mnemonic phrases to a gitignored .env file.

//------------------------
// That is a bad practice
//------------------------
// Because you might compromise your account's private key. 
// Especially when you are going to share the project with others.

//------------------------
// What is the solution?
//------------------------
// Truffle Dashboard was developed to provide an easy way 
// to use your existing MetaMask wallet for smart contracts deployment 
// and even for any other transactions that you need to send from a command line context.

//------------------------
// How to use Truffle Dashboard?
//------------------------

// 1- Start a dashboard
$ truffle dashboard

// 2- Connecting to the dashboard
$ truffle migrate --network dashboard
