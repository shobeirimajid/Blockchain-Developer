const HelloBlockchain = artifacts.require("HelloBlockchain");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("HelloBlockchain", function (/* accounts */) {
  it("should assert true", async function () {
    await HelloBlockchain.deployed();
    return assert.isTrue(true);
  });
});
