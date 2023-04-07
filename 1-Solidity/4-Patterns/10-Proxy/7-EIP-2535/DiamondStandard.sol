/*
    ---------------------------------------------
    EIP-2535: Diamond Standard
    ---------------------------------------------
    https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/11-eip-2535-diamond-standard/

    The Diamond Standard is an improvement over EIP-1538. 
    It has the same idea: 
        To map single functions for a delegatecall to addresses, instead of proxying a whole contract through.

    The important part of the Diamond Standard is the way storage works.
    Unlike the unstructured storage pattern that OpenZeppelin uses, 
    the Diamond Storage is putting a single struct to a specific storage slot.

    Function wise it looks like this, given from the EIP Page:
*/


 // A contract that implements diamond storage.
library LibDiamond {

  // This struct contains state variables we care about.
  struct DiamondStorage {
    address owner;
    bytes32 dataA;
  }

  // Returns the struct from a specified position in contract storage
  // ds is short for DiamondStorage
  function diamondStorage() internal pure returns(DiamondStorage storage ds) {
    // Specifies a random position from a hash of a string
    bytes32 storagePosition = keccak256("diamond.storage.LibA");
    // Set the position of our struct in contract storage
    assembly {ds.slot := storagePosition}
  }
}


// Our facet uses the diamond storage defined above.
contract Facet {

  function setDataA(bytes32 _dataA) external {
    LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
    require(ds.owner == msg.sender, "Must be owner.");
    ds.dataA = _dataA;
  }

  function getDataA() external view returns (bytes32) {
    return LibDiamond.diamondStorage().dataA;
  }
}



/**
    Having this, you can have as many LibXYZ and FacetXYZ as you want, 
    they are always in a separate storage slot as a whole, because of the whole struct. 
    
    To completely understand it, this is stored in the Proxy contract that does the delegatecall, 
        not in the Faucet itself.

    That's why you can share storage across other faucets. 
    Every storage slot is defined manually  
        (keccak256("diamond.storage.LibXYZ"))


    --------------------
    The Proxy Contract
    --------------------
    In the "Diamond Standard" everything revolves around the Diamond terms. 
        The idea is quite visually cutting a Diamond to add functions 
        (or mapping of addresses to functions and vice versa).

    The function to add Facets and functions is called "diamondCut".

    The functionality to view what functions a Facet has is called "Loupe": 
        It returns the function signatures and addresses 
        and everything else you might want to know about a Facet.

    There is not one way to implement this functionality. 
        Nick went ahead and created three different ways to do a reference implementation, 
        which can be seen on his repository.
        https://github.com/mudgen/Diamond

    First, checkout how the Smart Contracts are deployed in the migration file. 
        https://github.com/mudgen/diamond-1/blob/master/migrations/2_diamond.js

    This reveals that deploying the Diamond contract already gives the addresses 
    and function selectors of the DiamondCutFacet and the DiamondLoupeFacet. 
    Essentially making them part of the Diamond Proxy.

    If you checkout the test-case, 
    then you see exactly that the first test cases are getting back address<->signature mapping 
    and checking that these were really set in the Diamond proxy. 


*/