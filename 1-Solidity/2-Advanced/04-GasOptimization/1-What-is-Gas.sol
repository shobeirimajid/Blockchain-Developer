/*
    ----------------
    What is Gas
    ----------------
    https://ethereum.org/en/developers/docs/gas/
    https://blog.finxter.com/introduction-to-ethereums-gas-in-solidity-development/

    Gas is essential to the Blockchain networks. 
    It is the fuel that allows it to operate, in the same way that a car needs gasoline to run.

    Gas refers to the 'unit' that measures the amount of computational effort required 
        to execute specific operations on the Ethereum network

    Each Ethereum transaction requires computational resources to execute, 
        so each transaction requires a 'fee'
    
    Gas refers to the 'fee' required to execute a transaction on Ethereum, 
        regardless of transaction success or failure

    'Gas fees' are paid in Ethereum's native currency (Eth)

    Instead of saying that your gas costs (1_000_000_000 Wei)
     you can say your gas costs (1 Gwei)


    --------------------
    Eth currency units
    --------------------
    1 Eth       10^18 Wei
    1 Gwei      10^9 Wei (Gwei ~ giga-wei)

    Wei         smallest unit of ETH
    Wei Dai     name of the creator of 'b-money'


    -------------------------------------------
    Why do Gas Fees Exist?
    -------------------------------------------
    gas fees help keep the Ethereum network secure. 

    By requiring a fee for every computation executed on the network, 
    we prevent bad actors from spamming the network. 
    
    In order to avoid accidental or hostile infinite loops or other computational wastage in code, 
     each transaction is required to set a limit to 
     how many computational steps of code execution it can use.

    The fundamental unit of computation is "gas".

    Although a transaction includes a limit, 
    any gas not used in a transaction is returned to the user.
      
        
    -------------------------------------------
    Prior to the London Upgrade - August 2021
    -------------------------------------------

        Total_fee  =  Gas_limit (units)  *  Gas_price (per unit)

    
        Alice ----- pay 1 ETH ------> Bob 
        A standard ETH transfer requires a gas limit of 21,000 units of gas

        gas_limit = 21,000 units
        gas_price = 200 gwei (per unit)

        Total_fee = 21,000 * 200 = 4,200,000 gwei   (0.0042 ETH)


    
    -------------------------------------------
    After the London Upgrade - August 2021
    -------------------------------------------
    * Transactions with higher "priority_fee" have higher "priority" to be included in a block.
    
        Total_fee  =  Gas_used (units)  *  (base_fee + priority_fee)

        Total_fee               total amount of paid ether
        Gas_used (units)        total number of gas used in the transaction
        base_fee                set by the protocol (as a burn amount)
        priority_fee            set by the user (as a tip to the validator)


        Alice ----- pay 1 ETH ------> Bob
        A standard ETH transfer requires a gas limit of 21,000 units of gas

        Gas_used       = 21,000 units
        base fee       = 10 gwei
        Alice's tip    = 2 gwei


        Total_fee = 21,000 * (10 + 2) = 252,000 gwei (0.000252 ETH)  


            Validator's tip      2  *  21,000 = 42,000  gwei = 0.000042 ETH
            Burned               10 *  21,000 = 210,000 gwei = 0.00021 Eth


        -------------
        Block size
        -------------
        Before the London Upgrade, Ethereum had fixed-sized blocks. 
        In times of high network demand, these blocks operated at full capacity. 
        As a result, users often had to wait for demand to reduce to get included in a block,
         which led to a poor user experience.

        The London Upgrade introduced variable-sized blocks to Ethereum. 
        Each block has a target size of 15 million gas, 
        but the size of blocks will increase or decrease in accordance with network demand, 
        up until the block limit of 30 million gas (2x the target block size). 
        The protocol achieves an equilibrium block size of 15 million on average 
        through the process of tâtonnement. 
        
        This means if the block size is greater than the target block size, 
        the protocol will increase the base fee for the following block. 
        
        Similarly, the protocol will decrease the base fee if the block size is less than the target block size. 
        
        The amount by which the base fee is adjusted 
         is proportional to how far the current block size is from the target. 


        -------------
        Base fee
        -------------
        Every block has a base fee which acts as a reserve price. 
        To be eligible for inclusion in a block the 'offered price per gas' must 'at least' equal the 'base fee'. 
        The base fee is calculated independently of the current block and 
        is instead determined by the blocks before it - making transaction fees more predictable for users. 
        When the block is mined this base fee is "burned", removing it from circulation.

        The base fee is calculated by a formula that compares  
            the size of the previous block (the amount of gas used for all the transactions) 
            with the target size. 
        The base fee will increase by a maximum of 12.5% per block if the target block size is exceeded. 
        This exponential growth makes it economically non-viable for block size to remain high indefinitely.

        Relative to the pre-London gas auction market, 
        this transaction-fee-mechanism change causes fee prediction to be more reliable.
        
        It's also important to note it is unlikely we will see extended spikes of full blocks 
            because of the speed at which the base fee increases proceeding a full block.


        -------------
        maxFeePerGas
        -------------
        One of the main benefits of the London upgrade is improving the user's experience 
            when setting transaction fees. 
        For wallets that support the upgrade, 
            instead of explicitly stating how much you are willing to pay to get your transaction through,
            wallet providers will automatically set a recommended transaction fee 
            to reduce the amount of complexity burdened onto their users:
            
                 recommended transaction fee = (base fee) + (recommended priority fee)

        To execute a transaction on the network, 
            Alice can also specify a maximum-limit she is willing to pay.

        For a transaction to be executed, 
            the maxFeePerGas must exceed the sum of the base_fee and the priority_fee (tip)

            maxFeePerGas  >=  (base_fee) + (recommended priority fee)

        Alice is refunded the difference 
            between the maxFeePerGas and the sum of base_fee and priority_fee.
        
            refund  =  maxFeePerGas  -  (base_fee + priority_fee)
        
        Alice can set a maximum amount to pay for the transaction to execute 
        and not worry about overpaying "beyond" the base fee when the transaction is executed.


    ----------------
    Gas Bounds
    ----------------
    There are 2 upper bounds to the amount of gas

    - User Gas_limit    set by you              max amount of Gas you're willing to use for your transaction
    - Block Gas_limit   set by the network      max amount of Gas allowed in a block


    --------------------------------
    GAS LIMIT - Out of Gas
    --------------------------------
    if you specify too little gas (lower than neded)
    the EVM will attempting to fulfill the transaction 
    but Tx's Gas reachs to the Bound (user gas_limit) and it will not complete
    The EVM then reverts any changes
    but consumed gas (bt the miner as a worth of work) will not be refunded

        - your transaction will stop        (fail)
        - State changes will be undone      (revert)
        - Gas spent will not be refunded    (consumed gas)


    --------------------------------
    Some transaction Gas costs
    --------------------------------
    - Every transaction costs at least 21,000 gas (“base fee”).

    - Each CREATE operation (creating a smart contract) costs 32,000 gas.

    - Each SSTORE operation (writing a uint256 value to storage) costs as follows:

        20,000 gas when the storage value is set from 0 to a non-zero value
        5,000  gas when the storage value is set from 0 to 0 or a non-zero to a non-zero value

    - Each CALL operation with a non-zero value costs 9,000 gas
        in which 2,300 gas is given to the recipient


*/