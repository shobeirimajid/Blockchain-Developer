// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Receiver {

    mapping (address => uint256) public payments;

    event Received(address sender, uint amount, uint gas);


    // This function is called for correct payments
    // i.e. every external calls that correctly invoke 'getPayments' to pay
    function getPayments() external payable {
        payments[msg.sender] += msg.value;
    }


    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }


    // Function to receive Ether
    // This function is called for plain Ether transfers that made via send() or transfer()
    // i.e. every call with "empty calldata" (without any specified function name)
    // msg.data must be empty
    receive() external payable {
        emit Received(msg.sender, msg.value, gasleft());
    }
}



contract Sender {

    address payable receiverAdr;
    Receiver receiver;

    constructor(address payable receiver_) {
        receiverAdr = receiver_;
        receiver = Receiver(receiver_);
    }


    // This function is no longer recommended for sending Ether.
    function payViaTransfer() public payable {
        receiverAdr.transfer(msg.value);
    }


    // This function is not recommended for sending Ether.
    function payViaSend() public payable {
        bool sent = receiverAdr.send(msg.value);      
        require(sent, "Failed to send Ether");  // Send returns true/false.
    }


    // This is the current recommended method to use.
    function payViaCall() public payable {
        (bool sent, /*bytes memory data*/) = receiverAdr.call{value: msg.value}("");
        require(sent, "Failed to send Ether");  // Call returns true/false.
    }


    // The Best way is to call a dedicated payment function
    function correctPayment() external payable {
        receiver.getPayments{value: msg.value}();
    }

}




/**

    How to send Ether?

        -------------------------------------------
        You can send Ether to other contracts by
        -------------------------------------------
        METHOD      GAS COST            IF FAIL
        -------------------------------------------
        transfer    2300 gas            throws error
        send        2300 gas            returns bool
        call        forward all gas     returns bool
        -------------------------------------------
            * gas limit for call adjustable *
        -------------------------------------------



    How to receive Ether?

        A contract receiving Ether must have at least one of the functions below

        -----------------------------------------------------------
        METHOD                              WHEN CALL
        -----------------------------------------------------------
        receive() external payable          if msg.data is empty
        fallback() external payable         otherwise
        -----------------------------------------------------------



    Which method should you use?

        'call' in combination with 're-entrancy guard' is the recommended method to use after December 2019.


    Guard against re-entrancy by:
        1. making all 'state changes' before 'calling other contracts'(External Calls)
        2. using 're-entrancy' guard modifier (OpenZeppelin)



    Which function is called, fallback() or receive()?


                         send Ether
                             |
                    msg.data is empty?
                            / \
                           /   \
                        yes     no
                        /         \
            receive() exists?   fallback()
                     /   \
                    yes   no
                 /         \
            receive()    fallback()

*/