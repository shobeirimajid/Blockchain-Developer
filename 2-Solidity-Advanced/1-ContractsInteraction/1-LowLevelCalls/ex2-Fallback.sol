// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Receiver {

    event Received(string handler, address sender, uint amount, uint gas);

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    fallback() external payable {
        emit Received("fallback", msg.sender, msg.value, gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Received("receive", msg.sender, msg.value, gasleft());
    }
}



contract Sender {

    address payable receiverAdr;
    Receiver receiver;

    constructor(address payable receiver_) {
        receiverAdr = receiver_;
        receiver = Receiver(receiver_);
    }

    function transferToFallback() public payable {
        receiverAdr.transfer(msg.value);
    }

    function callFallback() public payable {
        (bool sent, /*bytes memory data*/) = receiverAdr.call{value: msg.value}("");
        require(sent, "Failed to send Ether");  // Call returns true/false.
    }

}




/*

    'fallback' is executed when:
        - 'non-exixting' function is called
        - Ether is sent directly to a contract but 'does not exist receive function' or 'msg.data is not empty'

    fallback has a '2300 gas limit' when called by 'transfer' or 'send'


    fallback is executed when:
    'non-exixting' function is called
    does not exist 'receive' function' or 'msg.data' is not empty

    send / transfer      forwards 2300 gas to this fallback function
    call                 forwards all of the gas


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