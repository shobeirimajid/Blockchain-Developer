////////////////////////////////////////////////
//              Test your contracts
////////////////////////////////////////////////


//---------------------
//  1- Framework
//---------------------

// Truffle comes standard with an `automated testing framework` 
// to make testing your contracts a breeze. 

// This framework lets you write simple and manageable tests in two different ways:

//      (a) In `Javascript` and `TypeScript`
//          for exercising your contracts from the outside world, just like your application.

//      (b) In `Solidity`
//          for exercising your contracts in advanced, bare-to-the-metal scenarios.

// Both styles of tests have their advantages and drawbacks. 



//---------------------
//  2- Location
//---------------------

// All test files should be located in the ./test directory. 
// Truffle will only run test files with the following file extensions, All other files are ignored:

//  .js 
//  .ts
//  .es
//  .es6
//  .jsx
//  .sol



//---------------------
//  3- Command
//---------------------

// To run all tests, simply run:

//   
//    $ truffle test
//   

// Alternatively, you can specify a path to a specific file you want to run:

//   
//    $ truffle test ./path/test_file.js
//   

// Note: When the truffle test process exits, 
// its exit code is equal to the number of failing tests. 
// If there are more than 255 failing tests, it will exit with code 255.



//----------------------------
//  4- Clean-room environment
//----------------------------
// Truffle provides a `clean room environment` when running your test files. 

// When running your tests against `Ganache` or `Truffle Develop`, 
// Truffle will use advanced `snapshotting` features 
// to ensure your test files don't share `state` with each other.

// When running against other `Ethereum clients` like `go-ethereum`, 
// Truffle will `re-deploy` all of your migrations at the beginning of every test file 
// to ensure you have a `fresh set of contracts` to test against.



//----------------------------------------
//  5- Speed and reliability considerations
//----------------------------------------

// Both Ganache and Truffle Develop are significantly faster than other clients 
// when running automated tests. 

// Moreover, they contain special features which Truffle takes advantage of 
// to speed up test runtime by almost 90%

// As a general workflow, we recommend you :

//  (a) - normal development and testing
//
//          `Ganache` 
//          `Truffle Develop`
//  
//  (b) - gearing up to deploy to live or production networks
//
//          `go-ethereum` 
//          or another official `Ethereum client`



//---------------------
//  6- Stack Traces
//---------------------
// You can obtain `Solidity stack traces` for `failed transactions` with :
// 
//          truffle test --stacktrace
//
// This will produce `stack traces` for transactions and deployments made via `Truffle Contract` 
// during your tests should one of them revert and thereby causes your test to fail.

// This option is still experimental
// and stack traces are not currently supported for `calls` or `gas estimates` 
// Moreover, while it is turned on, `PromiEvent` functionality of Truffle Contract 
// (as opposed to Promise functionality) may not work.

// There is also the option 
//
//      truffle test --stacktrace-extra
//
// This will turn on `stack traces` 
// and will additionally compile contracts in Solidity's `debug mode` 
// for additional `revert messages`
//
// This `debug mode` was only introduced in Solidity `0.6.3` 
// so it will have no effect on earlier versions of Solidity. 
//
// Using `debug mode` may cause problems on larger contracts