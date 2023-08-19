require("@nomicfoundation/hardhat-ethers");
require('dotenv').config()

/** 
 * @type import('hardhat/config').HardhatUserConfig 
 */
module.exports = {
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
        url: process.env.SEPOLIA_RPC_URL,
        accounts: [process.env.PRIVATE_KEY],
        saveDeployments: true
    }
  },
  solidity: "0.8.19"
};