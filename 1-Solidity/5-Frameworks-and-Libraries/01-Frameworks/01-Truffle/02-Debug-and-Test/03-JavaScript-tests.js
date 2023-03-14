////////////////////////////////////////////////
//         Use the Truffle debugger
////////////////////////////////////////////////

// Truffle uses the `Mocha` testing framework and `Chai` for `assertions`
// to provide you with a solid framework from which to write your JavaScript tests. 

// Let's dive in and see how Truffle builds on top of Mocha to make testing your contracts a breeze.

// Note: If you're unfamiliar with writing unit tests in `Mocha`, 
// please see Mocha's documentation before continuing.

// Mocha :  https://mochajs.org
// Chai  :  https://chaijs.com



//-----------------------------------------------------
//  1- Use contract() instead of describe()
//-----------------------------------------------------

// Structurally, your tests should remain largely unchanged from that of Mocha: 
// Your tests should exist in the `./test` directory, 
// they should end with a .js extension, 
// and they should contain code that Mocha will recognize as an automated test. 

// What makes `Truffle` tests different from that of `Mocha` is the function :
// 
//      contract()
//
// This function works exactly like function :
//
//      describe() 
//
// except contract() enables Truffle's clean-room features.
// It works like this:
//
// Before each contract() function is run,
// your contracts are redeployed to the running Ethereum client 
// so the tests within it run with a clean contract state.
//
// The contract() function provides a list of accounts made available by your Ethereum client 
// which you can use to write tests.
//
// Since Truffle uses `Mocha` under the hood, 
// you can still use describe() to run normal Mocha tests 
// whenever Truffle `clean-room` features are unnecessary




//-----------------------------------------------------
//  2- Use contract abstractions within your tests
//-----------------------------------------------------

// Contract `abstractions` are the basis for making contract interaction possible from JavaScript 

// they're basically our flux capacitor: 
// https://www.youtube.com/watch?v=EhU862ONFys

// Because `Truffle` has no way of detecting which contracts you'll need to interact with 
// within your tests, you'll need to ask for those contracts explicitly. 
// You do this by using the method:
//
//      artifacts.require() 
// 
// this method provided by Truffle that allows you to request a usable contract abstraction 
// for a specific Solidity contract. 

// As you'll see in the example below, you can then use this abstraction 
// to make sure your contracts are working properly.

// For more information on using contract abstractions, 
// see the Interacting With Your Contracts section:
// https://trufflesuite.com/docs/truffle/getting-started/interacting-with-your-contracts




//-----------------------------------------------------
//  3- Using artifacts.require()
//-----------------------------------------------------

// Using artifacts.require() within your tests works the same way as using it within your migrations; 
// you just need to pass the name of the contract. 

// See the artifacts.require() documentation in the Migrations section for detailed usage:
// https://trufflesuite.com/docs/truffle/getting-started/running-migrations#artifactsrequire




//-----------------------------------------------------
//  4- Using web3
//-----------------------------------------------------

// A web3 instance is available in each test file, 
// configured to the correct provider. 
// So calling `web3.eth.getBalance` just works!




//-----------------------------------------------------
//  5- Examples
//-----------------------------------------------------

// Here's an example test provided in the `MetaCoin` Truffle Box 
// using async/await notation. 

// Note the use of the:

//      contract()             for use the Truffle's clean-room feature
//      accounts               array for specifying available Ethereum accounts
//      artifacts.require()    for interacting directly with our contracts


//--------------------------
// File: ./test/metacoin.js
//--------------------------

const MetaCoin = artifacts.require("MetaCoin");

contract("MetaCoin", (accounts) => {

  it("should put 10000 MetaCoin in the first account", async () => {
    const metaCoinInstance = await MetaCoin.deployed();

    const balance = await metaCoinInstance.getBalance.call(accounts[0]);

    assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
  });

  it("should call a function that depends on a linked library", async () => {
    const metaCoinInstance = await MetaCoin.deployed();

    const metaCoinBalance = (
      await metaCoinInstance.getBalance.call(accounts[0])
    ).toNumber();

    const metaCoinEthBalance = (
      await metaCoinInstance.getBalanceInEth.call(accounts[0])
    ).toNumber();

    assert.equal(
      metaCoinEthBalance,
      2 * metaCoinBalance,
      "Library function returned unexpected function, linkage may be broken"
    );
  });

  it("should send coin correctly", async () => {
    const metaCoinInstance = await MetaCoin.deployed();

    // Setup 2 accounts.
    const accountOne = accounts[0];
    const accountTwo = accounts[1];

    // Get initial balances of first and second account.
    const accountOneStartingBalance = (
      await metaCoinInstance.getBalance.call(accountOne)
    ).toNumber();

    const accountTwoStartingBalance = (
      await metaCoinInstance.getBalance.call(accountTwo)
    ).toNumber();

    // Make transaction from first account to second.
    const amount = 10;
    await metaCoinInstance.sendCoin(accountTwo, amount, { from: accountOne });

    // Get balances of first and second account after the transactions.
    const accountOneEndingBalance = (
      await metaCoinInstance.getBalance.call(accountOne)
    ).toNumber();

    const accountTwoEndingBalance = (
      await metaCoinInstance.getBalance.call(accountTwo)
    ).toNumber();

    assert.equal(
      accountOneEndingBalance,
      accountOneStartingBalance - amount,
      "Amount wasn't correctly taken from the sender"
    );

    assert.equal(
      accountTwoEndingBalance,
      accountTwoStartingBalance + amount,
      "Amount wasn't correctly sent to the receiver"
    );

  });

});


//------------------------------------
// truffle test ./test/metacoin.js
//------------------------------------
// This test will produce the following output:

        // Contract: MetaCoin
        // √ should put 10000 MetaCoin in the first account (83ms)
        // √ should call a function that depends on a linked library (43ms)
        // √ should send coin correctly (122ms)

        // 3 passing (293ms)




//-----------------------------------------------------
//  6- Specifying tests
//-----------------------------------------------------

// You can limit the tests being executed to a specific file as follows:
//
//      truffle test ./test/metacoin.js
//
// See the full command reference for more information.
// https://trufflesuite.com/docs/truffle/reference/truffle-commands#test




//-----------------------------------------------------
//  7- Advanced
//-----------------------------------------------------

// Truffle gives you access to Mocha's configuration 
// so you can change how Mocha behaves. 


// See the project configuration section for more details.
// https://trufflesuite.com/docs/truffle/reference/configuration#mocha


// Check out our documentation on interacting with your contracts 
// for more tips, tricks and best practices.
// https://trufflesuite.com/docs/truffle/getting-started/interacting-with-your-contracts/




//-----------------------------------------------------
//  8- TypeScript File Support
//-----------------------------------------------------

// Truffle supports tests saved as a .ts TypeScript file. 
// Please see the Writing Tests in JavaScript guide for more information.
// https://www.typescriptlang.org/