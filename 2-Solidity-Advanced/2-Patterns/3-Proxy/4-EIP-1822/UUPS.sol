/*
    --------------------------------------------------------
    EIP-1822: Universal Upgradeable Proxy Standard (UUPS)
    --------------------------------------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/08-eip-1822-uups/

    UUPS is a clever solution without the need for a common Storage Smart Contract 
    to let the compiler know which storage slots to use.

    So, instead this methods just simply uses a pseudo-random storage slot 
    to store the address of the logic contract.

    Before I show you the example, the two important lines are these ones:

        1- sstore(0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7, contractLogic)

        2- let contractLogic := sload(0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7)

    So, in assembly you can store some variable to a specific storage slot 
        and then load it again from that slot. 

    In this case the EIP-1822 uses the 
        keccak256("PROXIABLE") = "0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7" 
    which results in the storage slot. 

    It's not 100% random, but random enough so that there's no collision happening. 
    Under normal circumstances at least. 

    You can deep dive into the Layout of Storage Variables in Solidity 
    then you'll see that there is little chance to create a collision.
    https://docs.soliditylang.org/en/v0.8.18/internals/layout_in_storage.html

    The full example using EIP-1822 could look like this:
*/


//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

contract Proxy {

    // Code position in storage is keccak256("PROXIABLE") = "0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7"
    constructor(bytes memory constructData, address contractLogic) {

        // save the code address
        assembly { // solium-disable-line
            sstore(0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7, contractLogic)
        }

        (bool success, bytes memory result ) = contractLogic.delegatecall(constructData); // solium-disable-line

        require(success, "Construction failed");
    }


    fallback() external payable {

        assembly { // solium-disable-line

            let contractLogic := sload(0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7)
            calldatacopy(0x0, 0x0, calldatasize())
            let success := delegatecall(sub(gas(), 10000), contractLogic, 0x0, calldatasize(), 0, 0)
            let retSz := returndatasize()
            returndatacopy(0, 0, retSz)
            switch success
            case 0 {
                revert(0, retSz)
            }
            default {
                return(0, retSz)
            }
        }
    }
}



contract Proxiable {
    // Code position in storage is keccak256("PROXIABLE") = "0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7"

    function updateCodeAddress(address newAddress) internal {
        require(
            bytes32(0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7) == Proxiable(newAddress).proxiableUUID(),
            "Not compatible"
        );

        assembly { // solium-disable-line
            sstore(0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7, newAddress)
        }
    }

    function proxiableUUID() public pure returns (bytes32) {
        return 0xc5f16f0fcc639fa48a6947836d9850f504798523bf8c9a3a87d5876cf622bcf7;
    }
} 



contract MyContract {

    address public owner;
    uint public myUint;

    function constructor1() public {
        require(owner == address(0), "Already initalized");
        owner = msg.sender;
    }

    function increment() public {
        //require(msg.sender == owner, "Only the owner can increment"); //someone forget to uncomment this
        myUint++;
    }
}


contract MyFinalContract is MyContract, Proxiable {

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed to perform this action");
        _;
    }
}



/*

    1.Deploy the MyFinalContract

    2.Deploy the Proxy, 
        argument is the MyFinalContract Address and as a calldata the bytes4(keccak256("constructor1()")). 
        This can be done with web3.utils.sha3('constructor1()').substring(0,10) in the Remix Console. 

    3.Then simply tell Remix that MyFinalContract is running on the address of the Proxy Contract. 


    If there's a change: 
        Deploy a new version of the MyFinalContract then update the Proxy with the new address.

    --------------------------------------------------------
    Removal of Variables is impossible
    --------------------------------------------------------
    One very important thing to note is that 
        you can't remove or mix variables that were defined earlier. 
    
    The problem is that they still reside in a specific storage slot in the Proxy contract 
        (pulled in the scope of the logic contract).

    If you remove a variable, then the Solidity compiler will simply assume that 
        the next variable is on the place of the previous one. 
        Your storage will clash again.


    It's already a pretty good implementation! 
    The only problem here is that the storage slot isn't really standardized. 
    That means, you can pretty much choose any storage slot you want to store the logic contract address.

    For block explorers that makes it very hard to act upon and show information to the user.

*/