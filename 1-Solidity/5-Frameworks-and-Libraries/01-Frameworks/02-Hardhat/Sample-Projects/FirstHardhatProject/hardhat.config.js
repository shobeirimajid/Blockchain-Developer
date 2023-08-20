//require("@nomicfoundation/hardhat-ethers");
require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config()

/** 
 * @type import('hardhat/config').HardhatUserConfig 
 */
module.exports = {
  solidity: "0.8.19",
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
        url: process.env.SEPOLIA_RPC_URL,
        accounts: [process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: {
      sepolia: process.env.ETERSCAN_API_KEY
    }
  }
};