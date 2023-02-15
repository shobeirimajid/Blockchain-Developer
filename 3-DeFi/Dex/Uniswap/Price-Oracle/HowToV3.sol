/*
    ----------------------
    Price Oracles
    ----------------------
    uniswapv3book
    Milestone 5. Fees and Price Oracle
    https://uniswapv3book.com/docs/milestone_5/introduction/

        --------------
        Introduction
        --------------

        In this milestone, we’re going to add two new features to our Uniswap implementation. 
        They share one similarity: 
            they work on top of what we have already built–that’s why we’ve delayed them until this milestone. 
            However, they’re not equally important.

        We’re going to add "swap fees" and a "price oracle":

            - Swap fees is a crucial mechanism of the DEX design we’re implementing. 
            They’re the glue that makes things stick together. 
            Swap fees incentivize liquidity providers to provide liquidity, and no trades are possible without liquidity, as we have already learned.

            - A price oracle, on the other hand, is an optional utility function of a DEX. 
            A DEX, while conducting trades, can also function as a price oracle–that is, provide token prices to other services. 
            This doesn’t affect actual swaps but provides a useful service to other on-chain applications.

        You’ll find the complete code of this chapter in this Github branch.
            https://github.com/Jeiwan/uniswapv3-code/tree/milestone_5

        This milestone introduces a lot of code changes in existing contracts. 

        If you have any questions feel free asking them in the GitHub Discussion of this milestone!


        --------------
        Swap Fees
        --------------
        https://uniswapv3book.com/docs/milestone_5/swap-fees/


        --------------
        Flash Loan Fees
        --------------
        https://uniswapv3book.com/docs/milestone_5/flash-loan-fees/


        --------------
        Protocol Fees
        --------------
        https://uniswapv3book.com/docs/milestone_5/protocol-fees/


        --------------
        Price Oracle
        --------------
        https://uniswapv3book.com/docs/milestone_5/price-oracle/

        The final mechanism we’re going to add to our DEX is a price oracle. 
        Even though it’s not essential to a DEX (there are DEXes that don’t implement a price oracle), 
        it’s still an important feature of Uniswap and something that’s interesting to learn about.

        What is Price Oracle?
            Price oracle is a mechanism that provides asset prices to blockchain. 
            Since blockchains are isolated ecosystems, there’s no direct way of querying external data, 
              e.g. fetching asset prices from centralized exchanges via API. 
            Another, a very hard one, problem is data validity and authenticity: 
            when fetching prices from an exchange, how do you know they’re real? 
            You have to trust the source. But the internet is not often secure and, 
            sometimes, prices can be manipulated, DNS records can be hijacked, API servers can go down, etc. 
            All these difficulties need to be addressed so we could have reliable and correct on-chain prices.

            One of the "first working solution" of the above mentioned problems was Chainlink. 
            Chainlink runs a decentralized network of oracles that 
               fetch asset prices from centralized exchanges via APIs, 
               average them, and provide them on-chain in a tamper-proof way. 
            Basically, Chainlink is a set of contracts with one state variable, asset price, 
            that can be read by anyone (any other contract or user) but can be written to only by oracles.
            This is one way of looking at price oracles. There’s another.

            If we have native on-chain exchanges, why would we need to fetch prices from outside? 
            This is how the Uniswap price oracle works. 
            Thanks to arbitraging and high liquidity, asset prices on Uniswap are close to those on centralized exchanges. 
            So, instead of using centralized exchanges as the source of truth for asset prices, we can use Uniswap, 
            and we don’t need to solve the problems related to delivering data on-chain (we also don’t need to trust to data providers).

        How Uniswap Price Oracle Works?
            Uniswap simply keeps the record of all previous swap prices. That’s it. 
            But instead of tracking actual prices, Uniswap tracks the accumulated price, 
            which is the sum of prices at each second in the history of a pool contract.

            This approach allows to find time-weighted average price between two points in time (t1 , t2)
            by simply getting the accumulated prices at these points (at1 , at2), 
            subtracting one from the other, and dividing by the number of seconds between the two points.

            This is how it worked in Uniswap V2. 
            In V3, it’s slightly different. 
            The price that’s accumulated is the current tick And instead of averaging prices, geometric mean is taken.

            To find the time-weighted geometric mean price between two points in time, 
            we take the accumulated values at these time points, 
            subtract one from the other, divide by the number of seconds between the two points, and calculate...

            Uniswap V2 didn’t store historical accumulated prices, 
            which required referring to a third-party blockchain data indexing service 
            to find a historical price when calculating an average one. 
            
            Uniswap V3, on the other hand, allows to store up to 65,535 historical accumulated prices, 
            which makes it much easier to calculate any historical time-weighter geometric price.

        Price Manipulation Mitigation
            Another important topic is price manipulation and how it’s mitigated in Uniswap.
            It’s theoretically possible to manipulate a pool’s price to your advantage: 
                for example, buy a big amount of tokens to raise its price 
                and get a profit on a third-party DeFi service that uses Uniswap price oracles, 
                then trade the tokens back to the real price. 
            To mitigate such attacks, Uniswap tracks prices at the end of a block, after the last trade of a block. 
            This removes the possibility of in-block price manipulations.

            Technically, prices in the Uniswap oracle are updated at the beginning of each block, 
            and each price is calculated before the first swap in a block.  

        Price Oracle Implementation
           Alright, let’s get to code.

        












*/