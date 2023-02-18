// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
pragma abicoder v2;
//pragma experimental ABIEncoderV2;



// Transparent upgradeable proxy pattern

contract CounterV1 {

    uint public count;

    function inc() external {
        count += 1;
    }
}



contract CounterV2 {

    uint public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}



contract BuggyProxy {

    address public implementation;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function _delegate() private {
        (bool ok, bytes memory res) = implementation.delegatecall(msg.data);
        require(ok, "delegatecall failed");
    }

    fallback() external payable {
        _delegate();
    }

    receive() external payable {
        _delegate();
    }

    function upgradeTo(address _implementation) external {
        require(msg.sender == admin, "not authorized");
        implementation = _implementation;
    }
}



contract Dev {

    function selectors() external pure returns (bytes4, bytes4, bytes4) {

        return (
            Proxy.admin.selector,
            Proxy.implementation.selector,
            Proxy.upgradeTo.selector
        );
    }
}



contract Proxy {

    // All functions and variables should be private 
    // Forward all calls to fallback

    // 1- for unknown preimage
    // 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc
    bytes32 private constant IMPLEMENTATION_SLOT = bytes32(
        uint(keccak256("eip1967.proxy.implementation")) - 1
    );

    // 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103
    bytes32 private constant ADMIN_SLOT = bytes32(
        uint(keccak256("eip1967.proxy.admin")) - 1)
    ;

    constructor() {
        _setAdmin(msg.sender);
    }

    modifier ifAdmin() {
        if (msg.sender == _getAdmin()) {
            _;
        } else {
            _fallback();
        }
    }


    function _getAdmin() private view returns (address) {
        return StorageSlot.getAddressSlot(ADMIN_SLOT).value;
    }

    function _setAdmin(address _admin) private {
        require(_admin != address(0), "admin = zero address");
        StorageSlot.getAddressSlot(ADMIN_SLOT).value = _admin;
    }

    // Admin interface
    function changeAdmin(address _admin) external ifAdmin {
        _setAdmin(_admin);
    }

    function _getImplementation() private view returns (address) {
        return StorageSlot.getAddressSlot(IMPLEMENTATION_SLOT).value;
    }

    function _setImplementation(address _implementation) private {
        require(_implementation.code.length > 0, "implementation is not contract");
        StorageSlot.getAddressSlot(IMPLEMENTATION_SLOT).value = _implementation;
    }

    // 0x3659cfe6
    function upgradeTo(address _implementation) external ifAdmin {
        _setImplementation(_implementation);
    }

    // 0xf851a440
    function admin() external ifAdmin returns (address) {
        return _getAdmin();
    }

    // 0x5c60da1b
    function implementation() external ifAdmin returns (address) {
        return _getImplementation();
    }


    // User interface
    function _delegate(address _implementation) internal virtual {

        assembly {

            // Copy msg.data
            // We take full control of memory in this inline assembly block
            // because it will not return to Solidity code.
            // We overwrite the 'Solidity scratch pad' at memory position 0.
            
            calldatacopy(       // calldatacopy(t, f, s) - copy s bytes from calldata at position f to memory at position t
                0,              // t: a position at memory
                0,              // f: a position at calldata
                calldatasize()  // s: size of data in bytes
            )


            // Call the implementation
            // 'out' and 'outsize' are 0 because we don't know the 'size' yet
            // returning 0 on error (eg. out of gas) and 1 on success

            let result := delegatecall(     // delegatecall(g, a, in, insize, out, outsize) - Call the implementation
                gas(),                      // g:               provided gas
                _implementation,            // a:               address of called contract
                0, calldatasize(),          // in, insize:      with input mem[in…(in + insize))
                0, 0                        // out, outsize:    output area mem[out…(out+outsize))
            )


            // Copy the returned data.
            // returndatacopy(t, f, s) - copy s bytes from returndata at position f to mem at position t
            // returndatasize() - size of the last returndata
            returndatacopy(
                0, 
                0, 
                returndatasize()
            )


            switch result
            case 0 {                    // delegatecall returns 0 on error
                revert(                 // revert(p, s) - revert state changes
                    0, returndatasize() // p,s: return data mem[p…(p+s))
                )
            }
            default { 
                return(                 // return(p, s) - end execution
                    0, returndatasize() // p,s: return data mem[p…(p+s))
                )
            }

        }
    }
    

    function _fallback() private {
        _delegate(_getImplementation());
    }

    fallback() external payable {
        _fallback();
    }

    receive() external payable {
        _fallback();
    }
}



contract ProxyAdmin {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function getProxyAdmin(address proxy) external view returns (address) {
        (bool ok, bytes memory res) = proxy.staticcall(abi.encodeCall(Proxy.admin, ()));
        require(ok, "call failed");
        return abi.decode(res, (address));
    }

    function getProxyImplementation(address proxy) external view returns (address) {
        (bool ok, bytes memory res) = proxy.staticcall(
            abi.encodeCall(Proxy.implementation, ())
        );
        require(ok, "call failed");
        return abi.decode(res, (address));
    }

    function changeProxyAdmin(address payable proxy, address _admin) external onlyOwner {
        Proxy(proxy).changeAdmin(_admin);
    }

    function upgrade(address payable proxy, address implementation) external onlyOwner {
        Proxy(proxy).upgradeTo(implementation);
    }
}



library StorageSlot {

    struct AddressSlot {
        address value;
    }

    function getAddressSlot(bytes32 slot) internal pure returns (AddressSlot storage r) {
        assembly {
            r.slot := slot
        }
    }
}



contract TestSlot {

    bytes32 public constant slot = keccak256("TEST_SLOT");

    function getSlot() external view returns (address) {
        return StorageSlot.getAddressSlot(slot).value;
    }

    function setSlot(address _addr) external {
        StorageSlot.getAddressSlot(slot).value = _addr;
    }
}




/*
    ----------------------
    Upgradeable Proxy
    ----------------------
    Example of upgradeable proxy contract.
        Never use this in production.


    This example shows:
        how to use 'delegatecall' and return data when 'fallback' is called.
        how to store address of admin and implementation in a specific slot.


    Video:
        https://youtu.be/EUOERNErbyI


    1- Deploy COUNTERV1
        0x1d142a62E2e98474093545D4A3A0f7DB9503B8BD

    2- Deploy COUNTERV2
        0xF27374C91BF602603AC5C9DaCC19BE431E3501cb

    3- Deploy Proxy
        0x26b989b9525Bb775C8DEDf70FeE40C36B397CE67

    4- Deploy ProxyAdmin
        0x8B801270f3e02eA2AACCf134333D5E5A019eFf42

    5- call Proxy.upgradeTo(address COUNTERV1)
        "address _implementation": "0x1d142a62E2e98474093545D4A3A0f7DB9503B8BD

    6- call Proxy.changeAdmin(address ProxyAdmin)
        "address _admin": "0x8B801270f3e02eA2AACCf134333D5E5A019eFf42"

    7- call ProxyAdmin.getProxyAdmin(address Proxy)
        returns: address of ProxyAdmin : 0x8B801270f3e02eA2AACCf134333D5E5A019eFf42

    8- call ProxyAdmin.getProxyOmplementation(address Proxy)
        returns: address of COUNTERV1 : 0x1d142a62E2e98474093545D4A3A0f7DB9503B8BD

    9- select CounterV1 and past address of proxy into "At Address"
        see "inc" and "count" in interface

    10- call ProxyAdmin.upgrade(Proxy adr, implementation : COUNTERV2 adr)

    11- select CounterV2 and past address of proxy into "At Address"
        see "dec", "inc" and "count" in interface

*/