/**
    -----------------------
    Multisignature wallet
    -----------------------

    https://en.wikipedia.org/wiki/Cryptocurrency_wallet#Multisignature_wallet
    https://github.com/ethereumbook/ethereumbook/blob/develop/06transactions.asciidoc

    In contrast to "simple cryptocurrency wallets" requiring just "one party" to "sign a transaction", 
        "multisignature wallets" require "multiple parties" to sign a transaction.
    
    Multisignature wallets are designed for "increased security"
    Usually, a multisignature algorithm produces a joint signature that is more compact than a collection of distinct signatures from all users.

    -----------------------
    MultiSigWallet capabilities
    -----------------------
        N-of-M voting
        delegation of votes
        transferring of votes
        arbitrary actions
        multiple outstanding votes via on-chain bookkeeping

    
    -----------------------
    List of Owners
    -----------------------
    This multisig wallet has multiple owners, who must all agree before funds are transferred from the wallet to a destination account. 
    The owners are stored in an array:

    contract UnanimousMultiSig {

        address[] public owners;  // immutable state

        constructor(address[] owners_) {
            owners = owners_;
        }

    }

    -----------------------
    Off-Chain Consensus
    -----------------------
    Agreement is done off-chain via signed messages. 
    The signed messages include four components:

        1- dest:      destination account that should receive the ether.
        2- value:   ether value that should be transferred.
        3- sign:    message’s (R,S,V) signature.
        4- nonce:   sequential nonce of the message. The nonce prevents a message replay vulnerability. 
                    Each successful transfer increments the nonce by one.

    
    -----------------------
    Execute Transactions
    -----------------------
    To cause a transfer, all of the owners must produce signed messages that agree on the destination, the value, and the nonce. 
        - The nonce must be the "expected nonce"

    Once messages are collected from all owners, anybody can present them to the wallet to invoke the transfer:


    uint256 public nonce;     // (only) mutable state

    function transfer(address dest, uint256 value, bytes32[] sigR, bytes32[] sigS, uint8[] sigV) external {

        bytes32 hash = prefixed(keccak256(abi.encodePacked(address(this), dest, value, nonce)));

        for (uint256 i = 0; i < owners.length; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered == owners[i]);
        }

        // If we make it here, all signatures are accounted for.
        nonce += 1;
        dest.transfer(value);
    }


    // Builds a prefixed hash to mimic the behavior of eth_sign.
    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message:\n32", hash));
    }



    -----------------------
    Execution order
    -----------------------
    The messages must be presented to the wallet in the same order as the owners were originally presented to the contract’s constructor.







*/