require("@nomiclabs/hardhat-waffle");
require('dotenv').config();
require("@uniswap/hardhat-v3-deploy");

module.exports = {
  solidity: "0.8.19",
  defaultNetwork: "hardhat",
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
