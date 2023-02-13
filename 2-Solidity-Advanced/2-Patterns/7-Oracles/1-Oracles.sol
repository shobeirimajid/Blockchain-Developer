/*
    -----------------------------
    What is blockchain oracles
    -----------------------------

    https://blockgeeks.com/guides/blockchain-oracles/
    https://ethereum.org/en/developers/docs/oracles/


        kinds of interoperability:

        * On-chain

            This method uses a third blockchain as a bridge between two different blockchains. 

                Hub and Spoke
                    the connecting blockchain acts as a central Hub to which the other blockchains aka spokes are connected to.

                Decentralized Exchange
                    Interoperability between two separate projects can be created by building a decentralized exchange.

                Bridge
                    In this method, the blockchain acts as a general-purpose bridge between the to aid communication and messaging.


        * Off-chain

            This method uses off-chain or middleware systems to facilitate interoperability.

                Atomic Swaps
                    Atomic swaps are a decentralized method used to exchange two assets without having to go through a centralized exchange. 

                State Channels
                    Layer-2 implementations like state channels can allow for off-chain interaction and atomic swaps.

                Operation System
                    A blockchain operating system enables cross-chain messaging and atomic swaps by running on top of the participating blockchains.

                Oracles
                    Oracles can allow a wide-degree of cross-communication across blockchains and enterprise systems, as well.

    
    Blockchain Oracles are a third-party services that 
        serve as "bridges" between "blockchains" and 
        can provide interoperability between "different blockchains" and communicate with "external data sources".

    we can also categorize oracles into :

        software oracles
            The information relayed within the software oracles comes from online sources like websites, backend APIs, or even other smart contracts.  
            The type of information included here can range from stock prices to sporting event data.

        hardware oracles
            Hardware oracles use IoT devices to track and verify real-world data before sending it to the smart contract.

    Promising blockchain oracle projects
        There are three oracle projects that we can trust them:

            ChainLink
                ChainLink is a decentralized oracle network built on ethereum.
                It aims to be a secure blockchain middleware that intends to connect different smart contracts across blockchains. 
                ChainLink is currently focussed on creating a decentralized network of oracles that are compatible with the 
                    Bitcoin, Ethereum, and Hyperledger blockchains.

            Augur
                Augur is a trustless, decentralized oracle, and prediction market platform.
                It leverages the wisdom of the crowd to speculate on and report the objective outcome of any event.
                Prediction markets are speculative markets that allow users to purchase and sell shares in the outcome of an event.

            RIF Gateways
                Rootstock (RSK) is a smart contract platform that is connected to Bitcoin´s blockchain through sidechain technology. 
                Rootstock allows you to create applications compatible with ethereum (the web3/EVM/Solidity model) 
                    while still enjoying the security provided by Bitcoin’s blockchain.

    Oracle nodes
        The oracle node is the off-chain component of the oracle service.
        it extracts information from external sources, such as APIs hosted on third-party servers, 
        and puts it on-chain for consumption by smart contracts. 
        Oracle nodes listen for events from the on-chain oracle contract and proceed to complete the task described in the log.

        A common task for oracle nodes is 
            sending a HTTP GET request to an API service, 
            parsing the response to extract relevant data, 
            formatting into a blockchain-readable output, and 
            sending it on-chain by including it in a transaction to the oracle contract. 
        
        The oracle node may also be required to attest to the validity and integrity of submitted information 
            using “authenticity proofs”

    
    

    


        

*/