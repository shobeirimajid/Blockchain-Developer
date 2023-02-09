
/**
    ---------------------
    calldata
    ---------------------

    abi.encodeWithSignature("transfer(address,uint256)", to, amount);

    abi.encodeWithSelector(bytes4(keccak256(bytes("transfer(address,uint256)"))), to, amount)
    abi.encodeWithSelector(IERC20.transfer.selector, to, amount)

    abi.encodeCall(IERC20.transfer, (to, amount))

    
    bytes memory calldata_    =   abi.encode(paramValues,..)

    (paramValues,..)          =   abi.decode(calldata_, (paramTypes,..))
*/



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;


contract CallData {

    struct MyStruct {
        string name;
        uint[2] nums;
    }

    function encodeWithSignature(uint amount) external view returns (bytes memory) {
        return abi.encodeWithSignature("setData(address,uint256)", msg.sender, amount);
    }

    function encodeWithSelector(uint amount) external view returns (bytes memory) {
        return abi.encodeWithSelector(ITarget.setData.selector, msg.sender, amount);
    }

    function encodeWithSelector2(uint amount) external view returns (bytes memory) {
        return abi.encodeWithSelector(bytes4(keccak256(bytes("setData(address,uint256)"))),  msg.sender, amount);
    }

    function encodeCall(uint amount) external view returns (bytes memory) {
        return abi.encodeCall(ITarget.setData, (msg.sender, amount));
    }


    function encode(
        uint x, 
        address addr, 
        uint[] calldata arr, 
        MyStruct calldata myStruct
    ) external pure returns (bytes memory) {
        return abi.encode(x, addr, arr, myStruct);
    }


    function decode(bytes calldata data) external pure returns (
        uint x, 
        address addr, 
        uint[] memory arr, 
        MyStruct memory myStruct
    ) {
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
    }
}




pragma solidity >=0.6.2 <0.9.0;

interface ITarget {
    function setData(address, uint) external;
}


contract Target {

    address public setter;
    uint public data;

    function setData(address setter_, uint data_) external {
        setter = setter_;
        data = data_;
    }
}


contract Caller {

    function callTarget(address _target, bytes calldata data) external {
        (bool result, ) = _target.call(data);
        require(result, "call failed");
    }
}