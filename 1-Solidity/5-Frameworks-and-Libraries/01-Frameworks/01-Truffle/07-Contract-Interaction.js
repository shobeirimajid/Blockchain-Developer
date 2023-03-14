////////////////////////////////////////////////
//         Interact with your contracts
////////////////////////////////////////////////

// If you were writing raw requests to the Ethereum network yourself in order to interact 
// with your contracts, you'd soon realize that writing these requests 
// is clunky and cumbersome. 
// As well, you might find that managing the state for each request you've made is complicated. 
// Fortunately, Truffle takes care of this complexity for you, 
// to make interacting with your contracts a breeze.


// Reading and writing data
// The Ethereum network makes a distinction between 
// writing data to the network and reading data from it, 
// and this distinction plays a significant part in how you write your application. 
// In general, writing data is called a transaction 
// whereas reading data is called a call. 
// Transactions and calls are treated very differently, and have the following characteristics.


// Transactions
// Transactions fundamentally change the state of the network. 
// A transaction can be as simple as sending Ether to another account, 
// or as complicated as executing a contract function or adding a new contract to the network. 
// The defining characteristic of a transaction is that it writes (or changes) data. 
// Transactions cost Ether to run, known as "gas", and transactions take time to process.
//  When you execute a contract's function via a transaction, 
// you cannot receive that function's return value 
// because the transaction isn't processed immediately. 
// In general, functions meant to be executed via a transaction will not return a value; 
// they will return a transaction id instead. 

// transactions:
//      - Cost gas (Ether)
//      - Change the state of the network
//      - Aren't processed immediately
//      - Won't expose a return value (only a transaction id).


// Calls
// Calls, on the other hand, are very different. 
// Calls can be used to execute code on the network, though no data will be permanently changed. 
// Calls are free to run, and their defining characteristic is that they read data. 
// When you execute a contract function via a call you will receive the return value immediately. 

// calls:
//      - Are free (do not cost gas)
//      - Do not change the state of the network
//      - Are processed immediately
//      - Will expose a return value


// Choosing between a transaction and a call is as simple as 
// deciding whether you want to read data, or write it.


// Contract abstraction
// contract abstractions are wrapper code that makes interaction with your contracts easy, 
// in a way that lets you forget about the many engines and gears executing under the hood. 
// Truffle uses its own contract abstraction via the @truffle/contract module, 
// and it is this contract abstraction that's described below.

// In order to appreciate the usefulness of a contract abstraction, 
// however, we first need a contract to talk about.
//  We'll use the MetaCoin contract available to you through Truffle Boxes 
// via: `truffle unbox metacoin`

// This contract has three methods aside from the constructor :

    // - sendCoin()
    // - getBalanceInEth()
    // - getBalance()
    
// All three methods can be executed as either a transaction or a call.



// Making a transaction
// The transaction params that you can set correspond to the fields in an Ethereum transaction:
    // from
    // to
    // gas
    // gasPrice
    // value
    // data
    // nonce

// Processing transaction results
// When you make a transaction, you're given a result object 
// that gives you a wealth of information about the transaction.
// Specifically, you get the following:

    // result.tx (string)       - Transaction hash
    // result.logs (array)      - Decoded events (logs) / result.logs[0]
    // result.receipt (object)  - Transaction receipt (includes the amount of gas used)


// Add a new contract to the network
// we've been using a contract abstraction that has already been deployed. 
// We can deploy our own version to the network using the .new() function:
let newInstance = await MetaCoin.new()
newInstance.addres      // '0x64307b67314b584b1E3Be606255bd683C835A876'


// Use a contract at a specific address
// If you already have an address for a contract, 
// you can create a new abstraction to represent the contract at that address.
let specificInstance = await MetaCoin.at("0x1234...");


// Sending ether to a contract
// You may simply want to send Ether directly to a contract, 
// or trigger a contract's fallback function. 
// You can do so using one of the following two options:

// Option 1: 
// Send a transaction directly to a contract via instance.sendTransaction()
// This is promisified like all available contract instance functions, 
// and has the same API as web3.eth.sendTransaction but without the callback. 
// The to value will be automatically filled in for you if not specified.
instance.sendTransaction({...}).then(function(result) {
  // Same transaction result object as above.
});

// Option 2: 
// There's also shorthand for just sending Ether directly:
instance.send(web3.utils.toWei("1", "ether")).then(function(result) {
  // Same result object as above.
});


// Special methods on Truffle contract objects
// There are a couple of special functions that 
// you can find on the actual contract methods of your contract abstractions:

    // estimateGas          - estimates the amount of gas that a transaction will require   
    // sendTransaction      - force a transaction to take place while executing a function
    // call                 - explicitly make a call
    // request              - returns an object that can be passed to web3.eth.{sendTransaction or call}


// This will give us an estimate of how much gas it will take to run the transaction specified.
const instance = await MyContract.deployed();
const amountOfGas = await instance.sendTokens.estimateGas(4, myAccount);


// Another useful thing to note is that you can also call this on a contract's new method 
// to see how much gas it will take to deploy. 
// So you can get the gas estimate for the contract's deployment :
Contract.new.estimateGas();




// Invoking overloaded methods
// The current implementation of Truffle's contract abstraction can mistakenly infer 
// the signature of an overloaded method even though it exists in the contract ABI.
// Therefore, some methods may not be accessible through the contract's instance, 
// but their accessors can be invoked explicitly via the .methods property of the contract.

// Please see this issue here for more information.
//   https://github.com/trufflesuite/truffle/issues/2868

// example:

/*
pragma solidity >=0.5.13 <0.7.0;

interface I {
    function write(string calldata str) external;
    function read() external view returns (string memory);
}

abstract contract A is I {

    string _str;
    
    constructor() public {}

    function write(string memory str)
        public
        override
    {
        _str = str;
    }

    function read() public view override returns (string memory){
        return _str;
    }
}

abstract contract B is A {

    uint256 _number;

    constructor() public A() {}

    function write(uint256 number, string memory str)
        public
    {
        _number = number;
        _str = str;
    }
}

contract C is B {
    constructor() public B() {}
}

*/

const c = await C.deployed();
// await c.write("One", { from: account });                 // this doesn't work
await c.methods["write(string)"]("One", { from: account }); // this is ok
await c.write("One"); // this work