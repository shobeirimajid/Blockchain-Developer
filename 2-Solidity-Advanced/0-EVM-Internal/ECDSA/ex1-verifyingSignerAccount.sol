// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;


/* Signature Verification

    How to Sign and Verify

    1. Signing
        1.1. Create message to sign
        1.2. Hash the message
        1.3. Sign the hash (off chain, keep your private key secret)

    2. Verify
        2.1. Recreate hash from the original message
        2.2. Recover signer from signature and hash
        2.3. Compare "recovered signer" to "claimed signer"
*/



contract VerifySignature {


    // -------------------------
    // Create and Hash the message
    // -------------------------
    // Get message hash to sign
    // getMessageHash(0xeDB13284078eCdBC33134641e301954a80E40829, 123, "coffee and donuts", 1)
    
    function getMessageHash(address _to, uint _amount, string memory _message, uint _nonce) public pure returns (bytes32 hash) {
        hash = keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
        // hash: "0xb6198f8de65cb531fc0d6f9f637c62263b05e89dd73eb35b499f1ce39c9ac1ca"
    }


    // -------------------------
    // Signing the Hash
    // -------------------------
    // using browser
    // --------------
    // ethereum.enable()
    // account = "0x07E707B56F1AEdB3C5830C73a01765C44C42EFAf"
    // hash = "0xb6198f8de65cb531fc0d6f9f637c62263b05e89dd73eb35b499f1ce39c9ac1ca"
    // ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)
    // 0x1507bac5542a4eb68eb75976c1af3bef4f224927861368c6f4b97babae272c1a1387d665d5dd41554e3b9199fc0f9e84f7c0f1aa74739823864f7c0ce1b1eed51b
    // --------------
    // using web3
    // --------------
    // web3.personal.sign(hash, web3.eth.defaultAccount, console.log)
    
    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32 signature) {

        // Signature is produced by signing a keccak256 hash with the following format: 
        // "\x19Ethereum Signed Message\n" + len(msg) + msg
        // Signature will be different for different accounts

        signature = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
        // signature: 0x1642a7ce6d34456dd399a02369fa2b7973561144eca783f461009243f006b6f0
    }


    // -------------------------
    // Verifying
    // -------------------------
    // signer = 0x07E707B56F1AEdB3C5830C73a01765C44C42EFAf
    // to = 0xeDB13284078eCdBC33134641e301954a80E40829
    // amount = 123
    // message = "coffee and donuts"
    // nonce = 1
    // --------------
    // signature: 0x1507bac5542a4eb68eb75976c1af3bef4f224927861368c6f4b97babae272c1a1387d665d5dd41554e3b9199fc0f9e84f7c0f1aa74739823864f7c0ce1b1eed51b

    function verify(address _claimedSigner, address _to, uint _amount, string memory _message, uint _nonce, bytes memory signature ) public pure returns (bool) {

        bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
        // messageHash: 0xb6198f8de65cb531fc0d6f9f637c62263b05e89dd73eb35b499f1ce39c9ac1ca

        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        // ethSignedMessageHash: 0x1642a7ce6d34456dd399a02369fa2b7973561144eca783f461009243f006b6f0

        return recoverSigner(ethSignedMessageHash, signature) == _claimedSigner;
    }


    // recognize real recovered Signer
    function recoverSigner(bytes32 _ethSignedMessageHash, bytes memory _signature) public pure returns (address recoveredSigner) {

        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        recoveredSigner = ecrecover(_ethSignedMessageHash, v, r, s);
        // recoveredSigner: 0x07E707B56F1AEdB3C5830C73a01765C44C42EFAf
    }


    function splitSignature(bytes memory sig) public pure returns (bytes32 r, bytes32 s, uint8 v) {

        require(sig.length == 65, "invalid signature length");

        assembly {

            // add(sig, 32) = <pointer of sig> + 32 - effectively, skips first 32 bytes of signature
            // mload(p) loads next 32 bytes starting at the memory address p into memory

            // first 32 bytes, after the length prefix
            // stores the length of the signature
            r := mload(add(sig, 32))

            // second 32 bytes
            s := mload(add(sig, 64))

            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(sig, 96)))
        }

        // r: 0x1507bac5542a4eb68eb75976c1af3bef4f224927861368c6f4b97babae272c1a
        // s: 0x1387d665d5dd41554e3b9199fc0f9e84f7c0f1aa74739823864f7c0ce1b1eed5
        // v: 27
    }
}



/*
    Sign with Remix:

    web3.eth.sign("Hello world", "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")
    signature = 0x4bb5c87f889dcef489ce5965930a33cd4a5a4e20b5c44f9abb948a10f8b5cc5176398e92d9faf9168af3fbf3cb4ab12b99f9c88d34ab91242cc9490f71ca3f751c

    web3.eth.sign('coffee and donuts', '0x5B38Da6a701c568545dCfcB03FcB875f56beddC4');
    signature = 0x8999928d67e153e099cc899a2326e6bb112bad0535ff5370aeead6b356f9d3c858d2851b8a08570e40696030e886e95fbd1e7f803f9d3d1d5436a4dfd9f674ad1b
*/