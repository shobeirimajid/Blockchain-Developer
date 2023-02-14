/*
    --------------------------------
    EIP-897: Delegate Proxy
    --------------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/07-eip-897-proxy/

    In order to avoid having two variables taking the same storage slot, 
        we need all contracts to be aware of the additional storage necessary for the proxy. 
        
    In other words: If we had a separate Smart Contract that does only the storage for the Proxy, 
    then we can use this as a base contract for our LostStorage, which is now not lost anymore.
*/



// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;


contract ProxyStorage {
    address public otherContractAddress;

    function setOtherAddressStorage(address _otherContract) internal {
        otherContractAddress = _otherContract;
    }
}


contract NotLostStorage is ProxyStorage {
    address public myAddress;
    uint public myUint;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function setMyUint(uint _uint) public {
        myUint = _uint;
    }

}


contract ProxyNoMoreClash is ProxyStorage {

    constructor(address _otherContract) {
        setOtherAddress(_otherContract);
    }

    function setOtherAddress(address _otherContract) public {
        super.setOtherAddressStorage(_otherContract);
    }

    // Fallback function allowing to perform a delegatecall to the given implementation.
    // This function will return whatever the implementation call returns
    fallback() payable external {

        address _impl = otherContractAddress;

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), _impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
}





/*

    If you have a look at the EIP-897, then you'll see 
        it references an implementation from aragonOS and zeppelinOS. 
    Under the hood it is this sample-implementation here. 
    They just add more bang like ownership so that only the admin can do upgrades etc. 

    1.Deploy the NoLostStorage
    2.Deploy the Proxy with the NoLostStorage address as the constructor argument
    3.Tell Remix that the NoLostStorage contract is running on the Proxy
    4.Call myAddress() - it's zero now, and you can set it to whatever you want.

    As the ProxyStorage contract is inherited by both, 
        the NoLostStorage and the Proxy, 
        the compiler will know that it can't just start again from storage slot 0. 
        You will not overwrite the storage slot anymore.
        But there are also some downsides to this.

    The Downside: Contract Modifications
        While this solution sounds pretty cool at first, 
        there is an obvious downside to this approach! 
        All upgradeable Smart Contracts have to extend ProxyStorage for this to work.

        If you develop all your Smart Contracts yourself,
            then you can probably add in the ProxyStorage Smart Contract to all your Smart Contracts, 
            but as soon as you go standardized - maybe with Smart Contract packages from OpenZeppelin ., 
            then it becomes increasingly harder.

        there is another way to avoid those storage collisions!
*/