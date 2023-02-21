// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library StorageSlot {

    // Wrap address in a struct so that it can be passed around as a storage pointer
    struct AddressSlot {
        address value;
    }


    // Get the pointer to AddressSlot stored at slot
    function getAddressSlot(bytes32 slot) internal pure returns (AddressSlot storage pointer) {

        assembly {
            pointer.slot := slot    
        }
    }

}



contract TestSlot {

    bytes32 public constant TEST_SLOT = keccak256("TEST_SLOT");


    function set(address _addr) external {

        StorageSlot.AddressSlot storage data = StorageSlot.getAddressSlot(TEST_SLOT);

        data.value = _addr;
    }


    function get() external view returns (address) {

        StorageSlot.AddressSlot storage data = StorageSlot.getAddressSlot(TEST_SLOT);

        return data.value;
    }
}



/*
    ---------------------
    Write to Any Slot
    ---------------------
    Solidity storage is like an array of length 2^256. 
    Each slot in the array can store 32 bytes.

    Order of declaration and the type of state variables define which slots it will use.

    However using assembly, you can write to any slot.
*/