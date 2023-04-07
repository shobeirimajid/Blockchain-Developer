// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

// ECDSA functions
// verify that the message was signed by the (private keys of) claimedSigner
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

// SignatureChecker can be used instead of `ECDSA.recover` 
// support two types of signatures: 
//    ECDSA signatures from EOAs (externally owned accounts) 
//    ERC1271 signatures from smart contract wallets like
import "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";


contract VerifySignatureOZ {

    using ECDSA for bytes32;
    using SignatureChecker  for address;


    // -------------------------
    // Create and Hash the message
    // -------------------------
    // to = 0xeDB13284078eCdBC33134641e301954a80E40829
    // amount = 123
    // message = "coffee and donuts"
    // nonce = 1
    // --------------
    // return : 0xb6198f8de65cb531fc0d6f9f637c62263b05e89dd73eb35b499f1ce39c9ac1ca
    
    function getMessaEncodePacked(address _to, uint _amount, string memory _message, uint _nonce) public pure returns (bytes32 hash) {
        hash = keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }


    // -------------------------
    // Verifying
    // -------------------------
    // hash : 0xb6198f8de65cb531fc0d6f9f637c62263b05e89dd73eb35b499f1ce39c9ac1ca
    // claimedSigner = 0x07E707B56F1AEdB3C5830C73a01765C44C42EFAf
    // signature: 0x1507bac5542a4eb68eb75976c1af3bef4f224927861368c6f4b97babae272c1a1387d665d5dd41554e3b9199fc0f9e84f7c0f1aa74739823864f7c0ce1b1eed51b
    // -------------------------


    // verify that the message was signed by the (private keys of) claimedSigner
    function ECDSAverify(bytes32 hash, address claimedSigner, bytes memory signature) public pure returns (bool) {
        return hash.toEthSignedMessageHash().recover(signature) == claimedSigner;      
    }


    // isValidSignatureNow can be used instead of `ECDSA.recover` 
    // support two types of signatures: 
    //    1. ECDSA signatures from EOAs (externally owned accounts) 
    //    2. ERC1271 signatures from SC wallets

    function ECDSAverifyV2(bytes32 hash, address claimedSigner, bytes memory signature) public view returns (bool) {
        return claimedSigner.isValidSignatureNow(hash.toEthSignedMessageHash(), signature);
    }
}