////////////////////////////////////////////////
//         Use the Truffle debugger
////////////////////////////////////////////////

// Truffle includes an integrated debugger 
// so that you can debug transactions made against your contracts. 

// This debugger looks and feels like existing command line debuggers 
// available for traditional development environments.


//---------------------
// Overview
//---------------------

// New in Truffle v5.1:
//  $ truffle test --debug
// Set breakpoints in your JavaScript tests with the new debug() global! 

// New in Truffle v5.1.29
//  $ truffle debug --fetch-external
// Debug transactions involving contracts not in your project 
// that are verified on Etherscan! (And as of v5.1.32, it works with Sourcify too!)

// New in Truffle v5.4.26
//  $ truffle debug --url <provider_url>چ
// Debug transactions without needing a Truffle project or config!

// Debugging a transaction on the blockchain is different than debugging traditional applications 
// (for instance, applications written in C++ or Javascript). 
// When debugging a transaction on the blockchain, you're not running the code in real-time; 
// instead, you're stepping over the historical execution of that transaction, 
// and mapping that execution onto its associated code. 

// This gives us many liberties in debugging, in that we can debug any transaction, any time, 
// so long as we have the code and artifacts for the contracts the transaction interacted with. 
// Think of these code and artifacts as akin to the debugging symbols needed by traditional debuggers.

// In order to debug transactions, you'll need the following:

        // 1- Truffle 4.0 or above

        // 2- The hash of a transaction on your desired blockchain. 
        //    If you are using the built-in blockchain and trying to debug a test execution, 
        //    you may obtain the hash by running truffle develop --log

        // 3- The source code and artifacts the transaction encounters

Note:
// ]t's okay if your desired transaction resulted in an exception or if it ran out of gas. 
// The transaction still exists on chain, and so you can still debug it!

Warning: 
// Debugging a transaction against a contract that was compiled with optimization enabled 
// may not work reliably



//---------------------
// In-test debugging
//---------------------

// Truffle v5.1 and above provides :

//      1- debug flag:
//          > truffle test --debug 

//      2- associated global function
//          > debug()

// allowing you to interrupt tests to debug specific operations.

// Instead of capturing the transaction hash as described below, 
// simply wrap any contract operation with debug(), like so:

it("should succeed", async function() {
    // wrap what you want to debug with `debug()`:
    await debug( myContract.myFunction(accounts[1], { from: accounts[0] }) );
    //           ^^^^^^^^^^^^^^^^^^ wrap contract operation ^^^^^^^^^^^^^^
});

// Then, run :
//      $ truffle test --debug

// Truffle will compile your sources and run your tests as normal 
// until reaching the operation in question. 
// At this point, Truffle will interrupt the normal test flow and start the debugger, 
// allowing you to set breakpoints, inspect Solidity variables, etc.

// See Writing tests in JavaScript for more information on truffle test:
    https://trufflesuite.com/docs/truffle/how-to/debug-test/write-tests-in-javascript/  

// See Interacting with your contracts to learn about contract operations:
    https://trufflesuite.com/docs/truffle/how-to/contracts/interact-with-your-contracts/

Note: 
// This feature currently doesn't work with `reverted` transactions; 
// until we fix this, you can debug those with direct use of `truffle debug`





continue ...   https://trufflesuite.com/docs/truffle/how-to/debug-test/use-the-truffle-debugger/#debugging-read-only-calls














