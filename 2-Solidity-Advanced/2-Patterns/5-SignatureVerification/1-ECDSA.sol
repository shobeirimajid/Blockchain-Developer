/*

    ------------------------------------------
    Checking Signatures On-Chain
    ------------------------------------------

        ECDSA : Elliptic Curve Digital Signature Algorithm

        "ECDSA" provides functions for recovering and managing Ethereum account "ECDSA signatures"
        
        "ECDSA signatures" are often generated via :
        
            web3.eth.sign    →   65 byte array ("bytes" in Solidity) 

                                [ [v (1)] , [r (32)] , [s (32)] ]



    ------------------------------------------
     ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns (address)
    ------------------------------------------

        recover the "address" associated with the public key from "elliptic curve signature" or return "zero" on error. 
        
        The ecrecover function input parameters correspond to "ECDSA values" of the "signature":

            r = first 32 bytes of signature

            s = second 32 bytes of signature

            v = final 1 byte of signature


        "ecrecover" returns an "address"
        You have to convert it to "address payable", in case you need to transfer funds to the recovered address.

        For further details, read example usage:
            https://ethereum.stackexchange.com/questions/1777/workflow-on-signing-a-string-with-private-key-followed-by-signature-verificatio



        ----------
        WARNING
        ----------
        If you use "ecrecover", be aware that a "valid signature" can be turned into a "different valid signature" 
            without requiring knowledge of the corresponding private key. 
        
        In the "Homestead" hard fork, this issue was fixed for _transaction_ signatures (see EIP-2), but the ecrecover function remained unchanged.
        This is usually not a problem unless you require signatures to be unique or use them to identify items. 
        
        
        "OpenZeppelin" have a ECDSA helper "library" that you can use as a wrapper for ecrecover without this issue.

                https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol



    ------------------------------------------
    OpenZeppelin ECDSA
    ------------------------------------------

    https://docs.openzeppelin.com/contracts/2.x/api/cryptography#ECDSA

        -----------
        FUNCTIONS
        -----------
        These functions can be used to "verify" that a "message was signed by the holder of the private keys of a given address".

            → recover(hash, signature)
            → toEthSignedMessageHash(hash)


        The "data signer" can be recovered with "ECDSA.recover"
        and its address compared to verify the "signature"

        Most wallets 
            will "hash the data" to sign 
            and add the prefix '\x19Ethereum Signed Message:\n'
        so when attempting to "recover" the "signer" of an "Ethereum signed message hash" 
            you’ll want to use "toEthSignedMessageHash"
            

        -----------
        EXAMPLE
        -----------
        using ECDSA for bytes32;

        function _verify(bytes32 data, address account) pure returns (bool) {

            return keccak256(data).toEthSignedMessageHash().recover(signature) == account;

        }
        
        ----------
        WARNING
        ----------
        Getting signature verification right is not trivial: make sure you fully read and understand ECDSA's documentation.


        ------------------------------------------
        recover(bytes32 hash, bytes signature) → address
        ------------------------------------------

            Returns the address that signed a hashed message (hash) with signature. 
            This address can then be used for verification purposes.

            The "ecrecover EVM opcode" allows for malleable (non-unique) signatures: 
                this function rejects them by requiring :
                    the "s" value to be in the lower half order, and 
                    the "v" value to be either 27 or 28.


        ----------
        NOTE
        ----------
        This call "does not revert" enywhere
        only returned value will be the "zero address" if ...
            - the "signature" is invalid
            - the "signer" is otherwise unable to be retrieved


        ----------
        WARNING
        ----------
        "hash" must be the result of a "hash operation" for the verification to be secure: 
            it is possible to craft signatures that recover to arbitrary addresses for non-hashed data. 

        A safe way to ensure this is by receiving a hash of the original message (which may otherwise be too long), 
        and then calling toEthSignedMessageHash on it.


        ------------------------------------------
        toEthSignedMessageHash(bytes32 hash) → bytes32
        ------------------------------------------
        Returns an "Ethereum Signed Message", created from a "hash". 

        This replicates the behavior of the "eth_sign" JSON-RPC method.


    ----------
    Note
    ----------
    When running 'sha256', 'ripemd160' or 'ecrecover' on a "private blockchain" LIKE Ganache, you might encounter "Out-of-Gas"

    This is because these functions are implemented as “precompiled contracts” 
        and only really exist after they receive the first message (although their contract code is hardcoded). 
    
    Messages to "non-existing contracts" are "more expensive" 
        and thus the execution might run into an Out-of-Gas error. 
    
    A workaround for this problem is to
        first send Wei (1 for example) to each of the contracts before you use them in your actual contracts.

    Nevertheless, there is not such an issue in the mainnet or testnet!

    ------------------------------------------
    Why would I need this?
    ------------------------------------------
    We've actually discussed several examples of how one would use this before:

        1. Meta Transactions
        2. ERC20-Permit

    Essentially you can verify signed data which doesn't have to come from the transaction signer.

*/