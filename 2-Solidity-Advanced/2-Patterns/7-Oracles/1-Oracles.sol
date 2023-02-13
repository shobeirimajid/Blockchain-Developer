/*
    -----------------------------
    What is blockchain oracles
    -----------------------------

    https://blockgeeks.com/guides/blockchain-oracles/
    https://ethereum.org/en/developers/docs/oracles/
    https://www.gemini.com/cryptopedia/crypto-oracle-blockchain-overview
    https://github.com/ethereumbook/ethereumbook/blob/develop/11oracles.asciidoc
    https://chain.link/education/blockchain-oracles

    Blockchain Oracles are a third-party services that serve as "bridges" between "blockchains" and 
    can provide interoperability between "different blockchains" and communicate with "external data sources".


    ------------------------------------
    kinds of interoperability
    ------------------------------------

    * On-chain

        This method uses a third blockchain as a bridge between two different blockchains. 

            [ Hub and Spoke ]
                the connecting blockchain acts as a central Hub to which the other blockchains aka spokes are connected to.

            [ Decentralized Exchange ]
                Interoperability between two separate projects can be created by building a decentralized exchange.

            [ Bridge ]
                In this method, the blockchain acts as a general-purpose bridge between the to aid communication and messaging.


    * Off-chain

        This method uses off-chain or middleware systems to facilitate interoperability.

            [ Atomic Swaps ]
                Atomic swaps are a decentralized method used to exchange two assets without having to go through a centralized exchange. 

            [ State Channels ]
                Layer-2 implementations like state channels can allow for off-chain interaction and atomic swaps.

            [ Operation System ]
                A blockchain operating system enables cross-chain messaging and atomic swaps by running on top of the participating blockchains.

            [ Oracles ]
                Oracles can allow a wide-degree of cross-communication across blockchains and enterprise systems, as well.


    ------------------------------------
    Oracle nodes
    ------------------------------------
        The oracle node is the off-chain component of the oracle service.
        it extracts information from external sources, such as APIs hosted on third-party servers, 
        and puts it on-chain for consumption by smart contracts. 
        Oracle nodes listen for events from the on-chain oracle contract and proceed to complete the task described in the log.

        A common task for oracle nodes is :
            - sending a HTTP GET request to an API service, 
            - parsing the response to extract relevant data, 
            - formatting into a blockchain-readable output, and 
            - sending it on-chain by including it in a transaction to the oracle contract. 
        
        The oracle node may also be required to attest to the validity and integrity of submitted information 
            using “authenticity proofs”


    ------------------------------------
    Oracles classification
    ------------------------------------

        [ software oracles ]
            The information relayed within the software oracles comes from online sources like websites, backend APIs, or even other smart contracts.  
            The type of information included here can range from stock prices to sporting event data.

        [ hardware oracles ]
            Hardware oracles use IoT devices to track and verify real-world data before sending it to the smart contract.


    ------------------------------------
    Oracle projects
    ------------------------------------

            [ ChainLink ]
                ChainLink is a decentralized oracle network built on ethereum.
                It aims to be a secure blockchain middleware that intends to connect different smart contracts across blockchains. 
                ChainLink is currently focussed on creating a decentralized network of oracles that are compatible with the 
                    Bitcoin, Ethereum, and Hyperledger blockchains.

            [ Augur ]
                Augur is a trustless, decentralized oracle, and prediction market platform.
                It leverages the wisdom of the crowd to speculate on and report the objective outcome of any event.
                Prediction markets are speculative markets that allow users to purchase and sell shares in the outcome of an event.

            [ RIF Gateways ]
                Rootstock (RSK) is a smart contract platform that is connected to Bitcoin´s blockchain through sidechain technology. 
                Rootstock allows you to create applications compatible with ethereum (the web3/EVM/Solidity model) 
                    while still enjoying the security provided by Bitcoin’s blockchain.

             [Provable ]
                Provable is the leading oracle service for smart contracts and blockchain applications, 
                    serving thousands of requests every day on platforms like 
                    Ethereum, Rootstock, R3 Corda, Hyperledger Fabric and EOS.
                https://docs.provable.xyz/
                https://soliditydeveloper.com/provable-randomness-oracle

            [ Fixer ]
                Powered by 15+ exchange rate data sources, 
                the Fixer API is capable of delivering real-time exchange rate data for 170 world currencies. 
                The API comes with multiple endpoints, each serving a different use case. 
                Endpoint functionalities include 
                    getting the latest exchange rate data for all or a specific set of currencies, 
                    converting amounts from one currency to another, 
                    retrieving Time-Series data for one or multiple currencies and 
                    querying the API for daily fluctuation data.
                https://fixer.io/documentation
                https://fixer.io/quickstart

            [ Uniswap ]
                it's a fully decentralized protocol for automated liquidity provision on Ethereum. 
                it's a decentralized exchange (DEX) relying on external liquidity providers 
                    that can add tokens to smart contract pools and users can trade those directly.
                Uniswap can be used as an oracle.
                You might want to get the price feed for DAI for example, 
                    so roughly the USD price for a given ERC-20 token. This can be done with Uniswap.
                https://soliditydeveloper.com/uniswap-oracle
                https://gist.github.com/gorgos/24166993b84da3015ad1dac58445778d


    ------------------------------------
    How to Work with ChainLink Oracles
    ------------------------------------
        https://chain.link/education/blockchain-oracles
        https://docs.chain.link/getting-started/conceptual-overview
        https://docs.chain.link/resources/create-a-chainlinked-project
        https://www.gemini.com/cryptopedia/topic/chainlink-link


        ------------------------------------
        LINK token
        ------------------------------------
            The LINK token is an ERC677 token that inherits functionality from the ERC20 token standard and 
                allows token transfers to contain a data payload. 
            It is used to pay node operators for retrieving data for smart contracts and 
                also for deposits placed by node operators as required by contract creators.
            Any wallet that handles ERC20 tokens can store LINK tokens. 
            The ERC677 token standard that the LINK token implements still retains all functionality of ERC20 tokens.

            Link Token Contract in chains:
                
                Ethereum Mainnet
                    Address	    0x514910771AF9Ca656af840dff83E8264EcF986CA
                    Name	    Chainlink Token
                    Symbol	    LINK
                    Decimals	18

                Goerli testnet
                    Address	    0x326C977E6efc84E512bB9C30f76E30c160eD06FB
                    Name	    Chainlink Token
                    Symbol	    LINK
                    Decimals	18

                Other Chains
                    https://docs.chain.link/resources/link-token-contracts


        ------------------------------------
        ChainLink Oracle capabilities
        ------------------------------------

            1. Data Feeds
                to obtain accurate real-time asset prices
                https://docs.chain.link/data-feeds/
            
            2. VRF (Verifiable Random Numbers)
                to consume randomness in your smart contracts.
                https://docs.chain.link/vrf/v2/introduction/

            3. Any API (Call External APIs)
                to Request & Receive data from any API using the Chainlink contract library.
                https://docs.chain.link/any-api/introduction/

            4. Automation (Automate Smart Contract Functions)
                Automating smart contract functions and regular contract maintenance.
                https://docs.chain.link/chainlink-automation/introduction/

        
        ------------------------------------
        1. ChainLink Price Feeds
        ------------------------------------
            https://docs.chain.link/data-feeds/price-feeds

            Chainlink Data Feeds are the quickest way to connect your "smart contracts" to the "real-world market prices of assets". 
            For example, one use for data feeds is to enable smart contracts to retrieve the latest pricing data of an asset in a single call.

            To get the full list of Chainlink Price Feeds running on the EVM Chains, 
            see the Contract Addresses page : https://docs.chain.link/data-feeds/price-feeds/addresses/

            To get PriceFeeds on Goerli testnet, you need the Goerli ETH:
                https://goerlifaucet.com/
                https://dashboard.alchemy.com/



        




    
    

    


        

*/