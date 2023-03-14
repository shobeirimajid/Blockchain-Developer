////////////////////////////////////////////////
//         Package Management via NPM
////////////////////////////////////////////////

// Truffle comes standard with npm integration, 
// and is aware of the node_modules directory in your project if it exists. 
// This means you can use and distribute contracts, dapps and Ethereum-enabled libraries via npm, 
// making your code available to others and other's code available to you.

// Package layout
// Projects created with Truffle have a specific layout by default 
// which enables them to be used as packages. 
// This layout isn't required, but if used as a common convention -- or "de-facto standard" -- 
// then distributing contracts and dapps through NPM will become much easier.

// The most important directories in a Truffle package are the following:

    //      /contracts
    //      /build      (which includes /build/contracts  created by Truffle)

// The first directory is your contracts directory, 
// which includes your raw Solidity contracts. 

// The second directory is the build directory, 
// and more specifically /build/contracts, which holds build artifacts in the form of .json files. 
// Including raw contracts in your package will allow others to 
// import those contracts within their own solidity code. 
// Similarly, including your .json build artifacts in your package 
// will allow others to seamlessly interact with your contracts from JavaScript, 
// which can be used in dapps, scripts and migrations.


// Using a package
// When using a package within your own project, 
// it is important to note that there are two places 
// where you might be interested in using other's contract code: 

    // 1- within your contracts
    // 2- within your Javascript code (migrations and tests)
    
// The following provides an example of each case, 
// and discusses techniques for making the most of other's contracts and build artifacts.


// Installing
// For this example, we're going to use the Example Truffle Library, 
// which provides a simple name registry that is deployed to the Morden test network. 
// In order to use it as a dependency, we must first install it within our project through npm:

$ cd my_project
$ npm install example-truffle-library

// Note that the last command above downloads the package and places it in directory: 
    my_project/node_modules 
    
// which is important for the examples below. 



// 1- Within your contracts

// To use a package's contracts within your contracts, 
// this can be as simple as Solidity's import statement.

// When your import path isn't explicitly relative or absolute,
// this signifies to Truffle that you're looking for a file from a specific named package. 

// Consider this example using the Example Truffle Library mentioned above:

import "example-truffle-library/contracts/SimpleNameRegistry.sol";

// Since the path didn't start with ./
// Truffle knows to look in your project's node_modules directory 
// for the example-truffle-library folder. 

// From there, it resolves the path to provide you the contract you requested.



// 2- Within JavaScript code

// To interact with package's contracts within JavaScript code, 
// you simply need to require that package's .json files,
// and then use the @truffle/contract module to turn those into usable abstractions:

var contract = require("@truffle/contract");
var jsonData = require("example-truffle-library/build/contracts/SimpleNameRegistry.json");
var SimpleNameRegistry = contract(jsonData);


//----------------------------------------
// How to get deployed contract's address
//----------------------------------------

// Note that artifacts.require takes care of creating an abstraction for us.
var SimpleNameRegistry = artifacts.require("example-truffle-library/SimpleNameRegistry");

module.exports = function(deployer) {
  // Deploy our contract, then set the address of the registry.
  deployer.deploy(MyContract).then(function() {
    return MyContract.deployed();
  }).then(function(deployed) {
    return deployed.setRegistry(SimpleNameRegistry.address);
  });
};