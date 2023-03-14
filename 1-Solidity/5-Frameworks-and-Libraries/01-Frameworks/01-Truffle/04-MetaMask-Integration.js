////////////////////////////////////////////////
//          Truffle and MetaMask
////////////////////////////////////////////////

// Before you can interact with smart contracts in a browser, 
// make sure they're compiled, deployed, and that
// you're interacting with them via web3 in client-side JavaScript. 


// ------------- @truffle/contract ---------------
// https://github.com/trufflesuite/truffle/tree/master/packages/contract
// Truffle has a library called @truffle/contract. 
// We recommend using the @truffle/contract library to interacting with contracts, 
// as it makes the interacting easier and more robust.
// It keeps information about the contract in sync with migrations, 
// so you don't need to change the contract's deployed address manually.

// For more information on these topics, including using @truffle/contract, 
// check out our Pet Shop tutorial.
// https://trufflesuite.com/guides/pet-shop

// example:
$.getJSON('Adoption.json', function(data) {
    // Get the necessary contract artifact file and instantiate it with @truffle/contract
    var AdoptionArtifact = data;
    App.contracts.Adoption = TruffleContract(AdoptionArtifact);
  
    // Set the provider for our contract
    App.contracts.Adoption.setProvider(App.web3Provider);
  
    // Use our contract to retrieve and mark the adopted pets
    return App.markAdopted();
});




//--------- Using MetaMask with Ganache  ---------

// Ganache is a graphical application that runs a blockchain 
// that can be used for testing purposes. 
// It runs on 127.0.0.1:7545

// Note: We recommend specifying `127.0.0.1` instead of `localhost` 
// because the address does not require a network connection 
// and so is more suitable for development.


// ---- Detecting MetaMask's web3 injection ----

// Before diving in, we'll need to make sure the dapp is checking for MetaMask's web3 instance 
// and that the extension itself is configured properly with Ganache.

// MetaMask injects its own web3 instance, 
// so we'll want to make sure we're checking for that. 
// After the window has loaded perform the following check:

// Is there an injected web3 instance?
if (typeof web3 !== 'undefined') {
    App.web3Provider = web3.currentProvider;
    web3 = new Web3(web3.currentProvider);
} else {
    // If no injected web3 instance is detected, fallback to Ganache.
    App.web3Provider = new web3.providers.HttpProvider('http://127.0.0.1:7545');
    web3 = new Web3(App.web3Provider);
}


//------ Using MetaMask with Truffle Develop ------

// `Truffle Develop` is a command-line application that runs a temporary blockchain 
// that is also used for testing purposes. 
// It runs on 127.0.0.1:9545

// Using MetaMask with Truffle Develop is very similar to that of Ganache. 
// The only difference is that Truffle Develop runs by default on 127.0.0.1:9545
// so you'll want to edit the above web3 code to say:

// Is there is an injected web3 instance?
if (typeof web3 !== 'undefined') {
    App.web3Provider = web3.currentProvider;
    web3 = new Web3(web3.currentProvider);
} else {
    // If no injected web3 instance is detected, fallback to Truffle Develop.
    App.web3Provider = new web3.providers.HttpProvider('http://127.0.0.1:9545');
    web3 = new Web3(App.web3Provider);
}

// In MetaMask, when entering the "New RPC URL", enter http://127.0.0.1:9545


//------ Using MetaMask with Ganache CLI ------

// Using MetaMask with Ganache CLI is also very similar to that of Ganache. 
// The only difference is that Ganache CLI runs by default on http://127.0.0.1:8545 
// so you'll want to edit the above web3 code to say:

// Is there is an injected web3 instance?
if (typeof web3 !== 'undefined') {
    App.web3Provider = web3.currentProvider;
    web3 = new Web3(web3.currentProvider);
} else {
    // If no injected web3 instance is detected, fallback to Ganache CLI.
    App.web3Provider = new web3.providers.HttpProvider('http://127.0.0.1:8545');
    web3 = new Web3(App.web3Provider);
}

// In MetaMask, when entering the "New RPC URL", enter http://127.0.0.1:8545