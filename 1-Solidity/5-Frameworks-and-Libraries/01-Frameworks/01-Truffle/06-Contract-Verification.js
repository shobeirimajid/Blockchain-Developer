////////////////////////////////////////////////
//           Contract verification
////////////////////////////////////////////////

// After deploying your application, you might want to use Etherscan's source code verification. 
// `Etherscan` is one of the most popular block explorers for Ethereum, 
// and by verifying your smart contract source code on their platform 
// users can see what your smart contracts do before they use your application. 

// This helps to grow trust in your smart contracts and your application. 

// Two way to do this is:

    // Etherscan web form    (https://etherscan.io/verifyContract)
    // truffle-plugin-verify (https://github.com/rkalis/truffle-plugin-verify)


//----------------------------------------
//          truffle-plugin-verify
//----------------------------------------
// the easiest way is Automatically verify Truffle smart contracts on Etherscan
// using `truffle-plugin-verify`
// This plugin integrates directly with Truffle's workflow to verify your smart contracts' source code.



// setting up and using the `truffle-plugin-verify`

https://github.com/rkalis/truffle-plugin-verify

https://kalis.me/verify-truffle-smart-contracts-etherscan/



//-------------------------
// Installation / preparation
//-------------------------

// 1- Install the plugin with npm or yarn

    npm install -D truffle-plugin-verify

    yarn add -D truffle-plugin-verify

// 2- Add the plugin to your truffle-config.js file

    module.exports = {
        /* ... rest of truffle-config */

        plugins: ['truffle-plugin-verify'],
    };

    // When only verifying on Sourcify, 
    // no more steps are required. 
    // When verifying on Etherscan (and derived explorers like PolygonScan), 
    // the appropriate API keys need to be specified:

// 3- Generate an API Key on your Etherscan account (see the Etherscan website)

    // Add your Etherscan API key to your truffle config 
    // (make sure to use something like dotenv so you don't commit the api key)

    module.exports = {
        /* ... rest of truffle-config */

        api_keys: {
            etherscan: 'MY_API_KEY',
        },
    };


//-------------------------
// Usage
//-------------------------
// truffle run verify SomeContractName AnotherContractName --network networkName [--debug] [--verifiers=etherscan,sourcify]

// truffle run verify ContractName

    truffle run verify SimpleStorage --network goerli

    truffle run verify SimpleStorage --network goerli --verifiers=etherscan

    truffle run verify SimpleStorage --network goerli --verifiers=sourcify

// we assume you already have a Truffle project with a deployment process set up. 
// you can set up deployment of Truffle projects with Infura.
// You can also check out the source code on GitHub.


//-------------------------
// Usage with the Truffle Dashboard
//-------------------------
// truffle-plugin-verify works with the Truffle Dashboard out of the box, 
// but for it to work correctly you need to make sure that you are running the truffle dashboard, 
// connected to the same network as you used for deployment and then run following command:

truffle run verify contractName


//-------------------------
// Usage with proxy contracts
//-------------------------
// This plugin supports EIP1967 proxies out of the box. 
// If you try to verify a proxy contract (e.g. contracts deployed with OpenZeppelin's deployProxy), 
// it will correctly verify the implementation contract and call Etherscan's "proxy verification" 
// so that the proxy contract gets marked as a proxy on Etherscan (enabling Read/Write as Proxy). 
// Note that EIP1967 Beacon contracts are not yet supported, 
// and other types of non-standard proxies are also not supported.

// When using OpenZeppelin's deployProxy functionality, proxy verification should work automatically. 
// For custom proxy contracts you need to use the --custom-proxy flag. 
// The name of the proxy contract should be passed after this flag.

truffle run verify SimpleTokenUpgradeable --network goerli
truffle run verify SimpleTokenUpgradeable --custom-proxy SimpleProxy --network goerli


//-------------------------
// Address override (Optional)
//-------------------------
// You can optionally provide an explicit address of the contract(s) that you wish to verify. 
// This may be useful when you have deployed multiple instances of the same contract. 
// The address is appended with @<address> as follows:

truffle run verify SimpleStorage@0x61C9157A9EfCaf6022243fA65Ef4666ECc9FD3D7 --network goerli


//-------------------------
// Run verification through an HTTP proxy (Optional)
//-------------------------
// In some cases the Etherscan or Sourcify websites may not be directly accessible. 
// In this case it is possible to configure proxy settings 
// so that the API requests will be made through this proxy. 
// To use this feature, please add the relevant proxy settings 
// to your truffle-config under verify.proxy.

module.exports = {
    /* ... rest of truffle-config */
  
    verify: {
      proxy: {
        host: '127.0.0.1',
        port: '1080',
      },
    },
};


//-------------------------
// Supported chains
//-------------------------
// These instructions were written for Ethereum mainnet and testnets, 
// but it also works for verification on other platforms for other chains. 
// Sourcify verification has support for many EVM based chains and no API keys are required. 
// For verification on Etherscan-derived explorers you can refer to the list below for supported chains. 
// Also make sure to request an API key from the platform that you're using 
// and add it to your truffle-config.js file. 
// If you want to verify your contracts on multiple chains, 
// please provide separate API keys.

module.exports = {
    /* ... rest of truffle-config */
  
    api_keys: {
      etherscan: 'MY_API_KEY',
      optimistic_etherscan: 'MY_API_KEY',
      arbiscan: 'MY_API_KEY',
      nova_arbiscan: 'MY_API_KEY',
      bscscan: 'MY_API_KEY',
      snowtrace: 'MY_API_KEY',
      polygonscan: 'MY_API_KEY',
      ftmscan: 'MY_API_KEY',
      hecoinfo: 'MY_API_KEY',
      moonscan: 'MY_API_KEY',
      moonriver_moonscan: 'MY_API_KEY',
      bttcscan: 'MY_API_KEY',
      aurorascan: 'MY_API_KEY',
      cronoscan: 'MY_API_KEY',
      gnosisscan: 'MY_API_KEY',
      celoscan: 'MY_API_KEY',
      clvscan: 'MY_API_KEY',
    },
};


/*
    All supported Etherscan-derived platforms & networks :

    Etherscan               (Ethereum Mainnet & Goerli, Sepolia Testnets)
    Optimistic Etherscan    (Optimistic Ethereum Mainnet & Goerli Testnet)
    Arbiscan                (Arbitrum Mainnet & Goerli Testnet)
    Arbiscan Nova           (Arbitrum Nova)
    BscScan                 (BSC Mainnet & Testnet)
    Snowtrace               (Avalanche Mainnet & Fuji Testnet)
    PolygonScan             (Polygon Mainnet & Mumbai Testnet)
    FtmScan                 (Fantom Mainnet & Testnet)
    HecoInfo                (HECO Mainnet & Testnet)
    Moonscan                (Moonbeam Mainnet & Moonbase Alpha Testnet)
    Moonriver Moonscan      (Moonriver Mainnet)
    BTTCScan                (BitTorrent Mainnet & Donau Testnet)
    Aurorascan              (Aurora Mainnet & Testnet)
    Cronoscan               (Cronos Mainnet & Testnet)
    Gnosisscan              (Gnosis Mainnet)
    CLVScan                 (CLV Mainnet)
    Celoscan                (Celo Mainnet & Alfajores Testnet)
*/


//-------------------------
// Note
//-------------------------
// This plugin has a naming conflict with the truffle-security plugin, 
// so when using both truffle-security and truffle-plugin-verify in the same project, 
// truffle run etherscan can be used instead of truffle run verify for truffle-plugin-verify.