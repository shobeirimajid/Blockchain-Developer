
/*
    ------------------------------------------
     keccak256(bytes memory) returns (bytes32)
    ------------------------------------------
        computes the Keccak-256 hash of the input.

        in 0.5.0 and older version of Solidiy, there was sha3 instead of keccak256

        Some use cases for Keccak256 are:

            * Creating a deterministic unique ID from a input
            * Commit-Reveal scheme
            * Compact cryptographic signature (by signing the hash instead of a larger input)


    ------------------------------------------
    ripemd160(bytes memory) returns (bytes20)
    ------------------------------------------
        compute RIPEMD-160 hash of the input
*/


contract HashFunction {


    function getTestBtye(string memory _text, uint _num, address _addr) public pure returns (bytes memory) {
         return abi.encodePacked(_text, _num, _addr);
    }

    // keccak256
    function keccak256hash(bytes memory data) public pure returns (bytes32) {
        return keccak256(data);
    }

    // ripemd160
    function ripemd160hash(bytes memory data) public pure returns (bytes32) {
        return ripemd160(data);
    }


    //------------------------------------------
    //  Hash Collision
    //------------------------------------------
    // Hash collision can occur when you pass more than one dynamic data type to "abi.encodePacked"
    //      encodePacked(AAA, BBB) -> AAABBB
    //      encodePacked(AA, ABBB) -> AAABBB
    // In such case, you should use "abi.encode" instead.

    function collision(string memory _text, string memory _anotherText) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _anotherText));
    }

    function collisionFree(string memory _text, string memory _anotherText) public pure returns (bytes32) {
        return keccak256(abi.encode(_text, _anotherText));
    }


    //------------------------------------------
    //  Validation
    //------------------------------------------

    // keccak256 hash of "Solidity"
    bytes32 public hashValue = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    function validation(string memory plain) public view returns (bool) {
        return keccak256(abi.encodePacked(plain)) == hashValue;
    }

}