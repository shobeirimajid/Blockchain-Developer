// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

interface IStorage {
    function setData(address, uint) external;
}


contract Storage {

    address public setter;
    uint public data;

    function setData(address setter_, uint data_) external {
        setter = setter_;
        data = data_;
    }
}


contract Caller {

    function callStorage(address _storage, bytes calldata data) external {
        (bool result, ) = _storage.call(data);
        require(result, "call failed");
    }

    function encodeWithSignature(uint amount) external view returns (bytes memory) {
        return abi.encodeWithSignature("setData(address,uint256)", msg.sender, amount);
    }

    function encodeWithSelector(uint amount) external view returns (bytes memory) {
        return abi.encodeWithSelector(IStorage.setData.selector, msg.sender, amount);
    }

    function encodeWithSelector2(uint amount) external view returns (bytes memory) {
        return abi.encodeWithSelector(bytes4(keccak256(bytes("setData(address,uint256)"))),  msg.sender, amount);
    }

    function encodeCall(uint amount) external view returns (bytes memory) {
        return abi.encodeCall(IStorage.setData, (msg.sender, amount));
    }
}



/**

    ---------------------
     Keccak256 Hash
    ---------------------

    keccak256 computes the Keccak-256 hash of the input.

    Some use cases are:

        Creating a deterministic unique ID from a input
        Commit-Reveal scheme
        Compact cryptographic signature (by signing the hash instead of a larger input)


    contract HashFunction {

        function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32) {
            return keccak256(abi.encodePacked(_text, _num, _addr));
        }

        // Example of hash collision
        // Hash collision can occur when you pass more than one dynamic data type to abi.encodePacked
        // In such case, you should use abi.encode instead.

        function collision(string memory _text, string memory _anotherText) public pure returns (bytes32) {
            // encodePacked(AAA, BBB) -> AAABBB
            // encodePacked(AA, ABBB) -> AAABBB
            return keccak256(abi.encodePacked(_text, _anotherText));
        }
    }

    contract GuessTheMagicWord {

        bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

        // Magic word is "Solidity"
        function guess(string memory _word) public view returns (bool) {
            return keccak256(abi.encodePacked(_word)) == answer;
        }
    }

*/





/**
    ---------------------
     calldata
    ---------------------

    abi.encodeWithSignature("transfer(address,uint256)", to, amount);

    abi.encodeWithSelector(bytes4(keccak256(bytes("transfer(address,uint256)"))), to, amount)
    abi.encodeWithSelector(IERC20.transfer.selector, to, amount)

    abi.encodeCall(IERC20.transfer, (to, amount))



    contract AbiDecode {

        struct MyStruct {
            string name;
            uint[2] nums;
        }

        function encode(
            uint x,
            address addr,
            uint[] calldata arr,
            MyStruct calldata myStruct
        ) external pure returns (bytes memory) {
            return abi.encode(x, addr, arr, myStruct);
        }

        function decode(bytes calldata data) external pure 
        returns (uint x, address addr, uint[] memory arr, MyStruct memory myStruct) {
            (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
        }
    }

*/




/*
    ---------------------
     Function Selector
    ---------------------

        When a function is called, the first "4 bytes" of "calldata" specifies "which function" to call.
        This "4 bytes" is called a "function selector".

        Example:

            addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))

            It uses call to execute transfer on a contract at the address addr.
            The first 4 bytes returned from abi.encodeWithSignature(....) is the function selector.

        Perhaps you can save a tiny amount of gas if you 
        precompute and inline the function selector in your code?

        --------------------------------------------------------------------
        funcSignature                                   function Selector
        --------------------------------------------------------------------
        "transfer(address,uint256)"                     0xa9059cbb
        "transferFrom(address,address,uint256)"         0x23b872dd
        --------------------------------------------------------------------

        Here is how the function selector is computed.

            contract FunctionSelector {

                function getSelector(string calldata funcSignature) external pure returns (bytes4) {
                    return bytes4(keccak256(bytes(funcSignature)));
                }
            }

*/