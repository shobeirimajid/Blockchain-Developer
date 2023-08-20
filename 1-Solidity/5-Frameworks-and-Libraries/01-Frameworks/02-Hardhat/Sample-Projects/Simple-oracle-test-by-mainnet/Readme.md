# Chainlink hardhat implementation

# QuickStart

Set your `ETHEREUM_RPC_URL` [environment variable.](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html). You can get one for free at [Alchemy's site.](https://alchemyapi.io/). You'll also need your `PRIVATE_KEY` which is available in you wallet, ie metamask. 

```
export PRIVATE_KEY='a2dd...'
export ETHEREUM_RPC_URL='https://eth-mainnet.g.alchemy.com/v2/Rd...'
```

Then run

1. `git clone https://github.com/shobeirimajid/hardhat-starter-kit-chainlink`
2. `cd hardhat-starter-kit-chainlink`
3. `yarn`
4. `npx hardhat test`

### You can start your own hardhat repo by following along in the [hardhat documentation](https://hardhat.org/getting-started/)

This repo makes use of hardhat's forking mechanism. This allows us to test forked versions of what we are working on, even mainnet!

`npx hardhat test` makes use of this, and in the `hardhat.config.js` file, you'll see it has a `forking` url. This will fork the network from our RPC_URL everytime we use that network. 

# Deploy 

Set your `SEPOLIA_RPC_URL` [environment variable.](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html)

`npx hardhat run --network sepolia scripts/deploy.js`
