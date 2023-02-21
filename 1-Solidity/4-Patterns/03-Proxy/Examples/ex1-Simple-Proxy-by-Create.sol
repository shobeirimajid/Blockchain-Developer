// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Proxy {

    event Deploy(address);

    receive() external payable {}


    function deploy(bytes memory _code) external payable returns (address addr) {

        assembly {
            
            addr := create(         // create(v, p, n)
                callvalue(),        // v = amount of ETH to send
                add(_code, 0x20),   // p = pointer in memory to start of code
                mload(_code)        // n = size of code
            )
        }

        // return address 0 on error
        require(addr != address(0), "deploy failed");

        emit Deploy(addr);
    }


    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}



contract TestContract1 {

    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}


contract TestContract2 {

    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}



contract Helper {

    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }


    function getBytecode2(uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }


    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}



/*
    ------------------------
    Deploy Any Contract
    ------------------------
    In this simple proxy example, the proxy contract address is always consistent.
    Proxy contract deploys a contract and has the address of the deployed contract 
    To execute functions of the deployed contract, proxy sends a call to the address of the deployed contract, 
        with giving the signature of the target function.

     
    Proxy.deploy(bytes memory _code)
        Deploy any contract
    
    Helper.getBytecode1 and Helper.getBytecode2
        get the contract bytecodes


    1. Deploy Proxy and Helper Contracts

    2. call Helper.getData1 to get bytecode of TestContract1
        0x6080604052336000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555034801561005057600080fd5b506102d7806100606000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c806313af40351461003b5780638da5cb5b14610057575b600080fd5b610055600480360381019061005091906101cd565b610075565b005b61005f610146565b60405161006c9190610209565b60405180910390f35b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614610103576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016100fa90610281565b60405180910390fd5b806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050565b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600080fd5b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b600061019a8261016f565b9050919050565b6101aa8161018f565b81146101b557600080fd5b50565b6000813590506101c7816101a1565b92915050565b6000602082840312156101e3576101e261016a565b5b60006101f1848285016101b8565b91505092915050565b6102038161018f565b82525050565b600060208201905061021e60008301846101fa565b92915050565b600082825260208201905092915050565b7f6e6f74206f776e65720000000000000000000000000000000000000000000000600082015250565b600061026b600983610224565b915061027682610235565b602082019050919050565b6000602082019050818103600083015261029a8161025e565b905091905056fea264697066735822122060c23c95e8f83212b716062956eb2e5a0534a8ec784bf9657801551beb14446c64736f6c63430008110033

    3. call Proxy.deply to deploy TestContract1 and get its address
        0xb8f43EC36718ecCb339B75B727736ba14F174d77

    4. call Helper.getCalldata(owner) to get calldata signature of TestContract1.setOwner(address)
        0x13af4035000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2

    5. call Proxy.execute to execute function setOwner from TestContract1 and chabge variable owner
        TestContract1 is deployed by proxy contract using create
        default value of owner is address of contract proxy
        
*/