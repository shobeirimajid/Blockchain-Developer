// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.1 <0.9.0;


contract owned {

    address payable owner;

    constructor() { 
        owner = payable(msg.sender); 
    }

    // This contract only defines a modifier but does not use it
    //   it will be used in derived contracts.

    // The function body is inserted where the special symbol `_;` in the definition of a modifier appears.
    // This means that if the owner calls this function, the function is executed 
    //   otherwise, an exception is thrown.

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

}



// This will report a warning due to deprecated selfdestruct

contract destructible is owned {

    // This contract inherits the `onlyOwner` modifier from `owned` and applies it to the `destroy` function
    // which causes that calls to `destroy` only have an effect if they are made by the stored owner.

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}



contract priced {

    // Modifiers can receive arguments:
    modifier costs(uint _value, uint _price) {
        /* 
        if (msg.value == price) {
            _;
        }
        */

        require(_value == _price, "value is not equal to price");
        _;
    }
}



contract Payment is destructible, priced {

    mapping(address => uint) public payments;
    uint public price;

    constructor(uint initialPrice) { 
        price = initialPrice; 
    }

    function changePrice(uint price_) public onlyOwner {
        price = price_;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getPayment(address sender) public payable costs(msg.value, price) {
        payments[sender] += msg.value;
    }

    receive() external payable {}
    fallback() external payable {}
}



contract Caller  {

    address pay;

    constructor(address _pay) { 
        pay = _pay; 
    }


    // It is important to also provide the `payable` keyword here, 
    // otherwise the function will automatically reject all Ether sent to it.

    function safePayment() public payable {

        require(contractExists(), "contract destructed");

        // Receiver.payment() will be executed
        (bool sent, /*bytes memory data*/) = pay.call{value: msg.value, gas: 6_000_000}
            (abi.encodeWithSignature("getPayment(address)", msg.sender));

        require(sent, "Payment Failed");
    }


    function contractExists() public view returns (bool) {
        uint size;
        address _dest = pay;

        assembly {
            size := extcodesize(_dest)
        }
        return (size > 0);
    }

    function getCode() public view returns (bytes memory) {
        return address(pay).code;
    }
}



contract Mutex {

    bool locked;


    modifier noReentrancy() {

        require(!locked, "Reentrant call.");

        locked = true;
        _;
        locked = false;
    }

    // This function is protected by a mutex
    // which means that reentrant calls from within `msg.sender.call` cannot call `f` again.
    // The `return 7` statement assigns 7 to the return value 
    // but still executes the statement `locked = false` in the modifier.

    function f() public noReentrancy returns (uint) {

        (bool success,) = msg.sender.call("");
        require(success);

        return 7;
    }
}