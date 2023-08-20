 require("@nomiclabs/hardhat-waffle");
 require('dotenv').config();

 task("accounts", "Print the list of accounts", async () => {
  const accounts = await ethers.getSigners();
  for(const acc of accounts) {
    console.log(acc.address);
  }
 });

module.exports = {
  solidity: "0.8.19",
}; 