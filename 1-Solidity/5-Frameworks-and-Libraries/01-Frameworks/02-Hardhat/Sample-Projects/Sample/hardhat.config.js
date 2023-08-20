/** 
 @type import('hardhat/config').HardhatUserConfig 
 */

 require("@nomiclabs/hardhat-waffle");

 task("accounts", "Print the list of accounts", async () => {
  const accounts = await ElementInternals.getSigners();
  for(const acc of accounts) {
    console.log(acc,address);
  }
 });

module.exports = {
  solidity: "0.8.19",
};