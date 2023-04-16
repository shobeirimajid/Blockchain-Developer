// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.18;

contract VerifySignature {

    string public message;
    bytes32 public hash;
    bytes public signature;

    constructor(string memory msg_) {
        message = msg_;
        hash = keccak256(abi.encodePacked(message));
    }

    function setSignature(bytes memory sig_) public {
        signature = sig_;
    }

    function getSignature(uint i) public view returns (bytes32) {
        return signature[i];
    }

    function splitSignature() public view returns (bytes32 r, bytes32 s, uint8 v) {
        bytes memory sig = signature ;
        require(sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(sig, 32))            // first 32 bytes
            s := mload(add(sig, 64))            // second 32 bytes
            v := byte(0, mload(add(sig, 96)))   // final byte (first byte of the next 32 bytes)
        }
    }

    function getSigner() public view returns (address recoveredSigner) {
        bytes32 ethSignedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)); 
        (bytes32 r, bytes32 s, uint8 v) = splitSignature();
        recoveredSigner = ecrecover(ethSignedHash, v, r, s);
    }
}



/*
    -------------------------
    1. getMessageHash()
    -------------------------
    _message: 'Hello world'    

    ===> hash:  "0xed6c11b0b5b808960df26f5bfc471d04c1995b0ffd2055925ad1be28d6baadfd"


    -------------------------
    2. Signing the Hash
    -------------------------
    account =   "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
    hash =      "0xed6c11b0b5b808960df26f5bfc471d04c1995b0ffd2055925ad1be28d6baadfd"

    ===> signature = 0x270d05fa60ed659fcbf65afaf7c40e7edb5ee69d4dbac8d63a8b278c7a1f7490740f13f06fac516b94d47e8657543ed8f47256ed604ead9b167ac7b74557c5d91b

        r: 0x270d05fa60ed659fcbf65afaf7c40e7edb5ee69d4dbac8d63a8b278c7a1f7490
        s: 0x740f13f06fac516b94d47e8657543ed8f47256ed604ead9b167ac7b74557c5d9
        v: 27

*/