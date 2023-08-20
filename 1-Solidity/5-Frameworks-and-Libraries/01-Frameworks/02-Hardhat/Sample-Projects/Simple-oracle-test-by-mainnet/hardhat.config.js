 require("@nomiclabs/hardhat-waffle");
 require('dotenv').config();

 // This is a sample Hardhat task to get list of the hardhat node account.
 task("accounts", "Print the list of accounts", async () => {
  const accounts = await ethers.getSigners();
  for(const acc of accounts) {
    console.log(acc.address);
  }
 });

// You need to export an object to set up your config
module.exports = {
  solidity: "0.8.19",
  networks: {
    hardhat: {
      forking: {
        url: process.env.ETHEREUM_RPC_URL
      }
    },
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
}; 