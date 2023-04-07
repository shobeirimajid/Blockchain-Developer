/*  
    -----------------------------------------------------         
    upgradeable Smart Contracts 
    -----------------------------------------------------
    Normally, The storage for Smart Contracts is bound to the Smart Contract Address. 
        So, if you make chainges in Logic of a SmartContract and re-deploy new version of it, 
        you'll have a contract with a "different address" and "different storage".


    ----------------------------------------
    Blockchain immutability
    ----------------------------------------
    For long time it was "Once it's deployed, it cannot be altered". 

    That is still true for historical transaction information, 
        But it is not true for Smart Contract "storage" and "addresses"

    "Smart Contracts" can be re-deployed to the "same address" using CREATE2.
    "Proxy Patterns" makes smartcontracts capable to have a new version at the same address.


    ----------------------------------------
    Different Proxy Patterns
    ----------------------------------------
        1. as a "contract upgradeability" mechanism
            to change the logic of the Smart Contract without any changes in "storage" and/or "addresses". 
       
        2. as a "gas savings" mechanism
            to Cheap "clone contracts" creation that save gas when deploying many instances of a particular contract. 


    ----------------------------------------
    Proxy Standards
    ----------------------------------------
    Here are the different standards that emerged for Smart Contract Upgrades:

        1. We're trying the Eternal Storage Pattern
            Actually it was initially proposed by "Elena Dimitrova" on this Blog
            https://blog.colony.io/writing-upgradeable-contracts-in-solidity-6743f0eecc88/

        2. We expand with Proxies where it all started (apparently):
            the upgradeable.sol gist from Nick Johnson, Lead developer of ENS & Ethereum Foundation alum.
            https://gist.github.com/Arachnid/4ca9da48d51e23e5cfe0f0e14dd6318f

        3. EIP-897: ERC DelegateProxy
            Created 2018-02-21 by Jorge Izquierdo and Manuel Araoz
            https://eips.ethereum.org/EIPS/eip-897

        4. EIP-1822: Universal Upgradeable Proxy Standard (UUPS)
            Created 2019-03-04 by Gabriel Barros and Patrick Gallagher
            https://eips.ethereum.org/EIPS/eip-1822

        5. EIP-1967: Standard Proxy Storage Slots
            Created 2019-04-24 by Santiago Palladino That's OpenZeppelin is using.
            https://eips.ethereum.org/EIPS/eip-1967

        6. EIP-1538: Transparent Contract Standard 
            Created 2018-10-31 by Nick Mudge
            https://eips.ethereum.org/EIPS/eip-1538

        7. EIP-2535: Diamond Standard 
            Created 2020-02-22 by Nick Mudge
            https://eips.ethereum.org/EIPS/eip-2535

        8. EIP-1014 CREATE2
            "Metamorphic Smart Contracts" Not really a standard, but I think should be covered as well.
            Those are Smart Contracts that get re-deployed to the "same address" with "different logic" using EIP-1014 CREATE2. 
            It's said to be wild magic in Ethereum.
            https://github.com/0age/metamorphic
            https://eips.ethereum.org/EIPS/eip-1014
            https://github.com/ethereum/EIPs/blob/master/EIPS/eip-1014.md

    
    Alright, that's it all methods to upgrade Smart Contracts.

    you learned to use all available methods to upgrade Smart Contracts. 

    From an audit perspective, it's always better to use a simpler method. 
    I am personally a big fan of KISS (keep it simple stupid), 
    although it sometimes means that it doesn't look elegant.

    I think the Diamond Storage is a very interesting way 
    to "deconstruct" a Smart Contract into smaller parts and plug them back together in a Proxy contract. 
    At this point I would not choose the architecture, 
    because it adds a new layer of complexity to an ecosystem that often manages large amounts of money.

    Knowing what's happening under the hood, 
    if I'd start a new larger project from scratch, 
     
    if upgradeability is necessary to keep an address constant, I'd use OpenZepplin Plugins .
        https://docs.openzeppelin.com/upgrades-plugins/1.x/
    
    If I don't need a constant address, I'd probably go with "Eternal Storage" pattern or something even simpler. 
        It's easier to audit, easier to grasp, and less error prone.

    
    




    

           
           call     ┌────────────────────┐              ┌────────────────────┐
       Proxy.foo()  │                    │              │                    │
User ───────────────►   Proxy Contract   │              │   Logic Contract   │
                    │                    │              │                    │
 ▲                  ├────────────────────┤ delegatecall └────────────────────┤
 │                  │                    ├──────────────►                    │
 │    foo() result  │     fallback()     │              │       foo()        │
 └──────────────────┤                    ◄──────────────┤                    │
                    ├────────────────────┐              └─────────┬──────────┘
                    │                    │                        │
                    │   storage/state    │                        │
                    │                    ├─ ── ── ── ── ── ── ── ─┘
                    └────────────────────┘       (shared state)




    User ---- tx ---> Proxy ----------> Implementation_v0
                     |
                      ------------> Implementation_v1
                     |
                      ------------> Implementation_v2


*/