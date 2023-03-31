// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.9.0;


// doesn't accept sent Ethers
contract Sink {

}


contract test {

    function endow() public payable {}


    // If that execution runs out of gas or fails in any way,
    // the Ether transfer will be "reverted" and the current contract will stop with an "exception".
    function transfer(address sink) public {
        address payable sinkPayable = payable(sink);
        sinkPayable.transfer(1 ether);
    }


    function send(address sink) public returns (bool) {
        // address(sink) will not allow to call 'sink' directly, 
        // since 'sink' has no payable fallback function
        // It has to be converted to the 'address payable' to even allow calling 'send' on it
        address payable sinkPayable = payable(sink);

        // There is no receive function in Test contract
        // If someone sends Ether to that contract, the send will fail
        // i.e. this returns false here.
        return sinkPayable.send(1 ether);
    }


    // returns false on failure
    function call(address sink) public returns (bool) {
        (bool result,) = sink.call{value: 1 ether}("");
        return result;
    }
}