require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

//to fetch these keys from .env file
const mnemonic = process.env.MNEMONIC;
const infura_api_key = process.env.INFURA_API_KEY;
const alchemy_api_key = process.env.ALCHEMy_API_KEY;

const etherscan_api_key = process.env.ETHERSCAN_API_KEY;

module.exports = {
  networks: {
    goerli: {
      /*provider: () => new HDWalletProvider(privateKey, `https://goerli.infura.io/v3/${infura_api_key}`),*/
      provider: () => new HDWalletProvider(mnemonic, "https://eth-goerli.g.alchemy.com/v2/E2uY9SQNC0CKo5pkCW_CGMFdaX2I-LWG"),
      network_id: '5',      //Goerli's id
      gas: 4465030,         //gas limit
      confirmations: 5,     // number of confs to wait between deployments. (default: 0)
      timeoutBlocks: 200   // number of blocks before a deployment times out  (minimum/default: 50)
      /*skipDryRun: true */     // Skip dry run before migrations? (default: false for public 
    },
    dashboard: {
      networkCheckTimeout: 120000,
    }
  },
  dashboard: {
    port: 24012,
  },
  plugins: ['truffle-plugin-verify'],
  api_keys: {
    etherscan: process.env.ETHERSCAN_API_KEY,
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.15"      // Fetch exact version from solc-bin
    }
  }
};
