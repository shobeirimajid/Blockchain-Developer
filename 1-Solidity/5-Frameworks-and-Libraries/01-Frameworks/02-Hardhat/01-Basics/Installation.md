# 1. Project Initialization
npm init --yes

# 2. Hardhat installation
npm install --save-dev hardhat
npx hardhat
select : "Create an empty hardhat.config.js"

# 3. ether.js installation
npm install --save-dev @nomicfoundation/hardhat-ethers ethers

# 4. dotenv installation
npm install --save-dev dotenv

# 5. create .env file
create a new file, call it .env

Put the following lines in the file:

KOVAN_RPC_URL='abc'
PRIVATE_KEY='123'

# 6. Editing hardhat.config.js file
// Tells hardhat to use the ethers library, 
// as well as the dotenv library for loading environment variables from a .env config file
require("@nomicfoundation/hardhat-ethers");
require('dotenv').config()

/** 
 * @type import('hardhat/config').HardhatUserConfig 
 */
module.exports = {

  // Specifies the networks that can be used for when we deploy smart contracts, 
  // in this case we will set the default to the Kovan sepolia.
  defaultNetwork: "sepolia",

  networks: {
      hardhat: {
          // // If you want to do some forking, uncomment this
          // forking: {
          //   url: MAINNET_RPC_URL
          // }
      },
      localhost: {
      },
      sepolia: {
          url: process.env.SEPOLIA_RPC_URL,
          accounts: [process.env.PRIVATE_KEY],
          saveDeployments: true,
      }
  },

  // Specifies a solidity compiler version to use for compiling our smart contracts
  solidity: "0.8.19",
};

# 7. create "contracts" folder
selected the top level folder of your project 
and create a new folder called ‘contracts’

# 8. create your smartcontract file
Select the contract folder in the explorer
create a new file, call it ‘MyFirstContract.sol’

put the following lines in the file:

// SPDX-License-Identifier: MIT
pragma solidity =0.8.19;
contract MyFirstContract {

    uint256 number;

    function setNumber(uint256 _num) public {
        number = _num;
    }

    function getNumber() public view returns (uint256){
        return number;
    }
}

# 9. compile the project
npx hardhat compile