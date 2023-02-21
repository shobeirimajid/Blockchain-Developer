// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
pragma abicoder v2;

import "@openzeppelin/contracts/access/Ownable.sol";


contract Auction is Ownable {
    
    uint public maxBid;

    event NewBid(address indexed bidder, uint indexed newBid);
    error NotValidBid(uint oldValue, uint newValue);

    enum State { Started, Ended }
    State public status;

    struct Bid { 
        uint bidAmount;
        uint bidtime;
    }

    mapping(address => Bid) bids;


    constructor(uint basePrice) {
        maxBid = basePrice;
    }


    modifier validStage() {
        require(status != State.Ended, "Auction has been ended.");
        _;
    }


    function start() public onlyOwner {
            status = State.Started;
    }


    function end() public onlyOwner {
            status = State.Ended;
    }


    function bid(uint bidAmount) public validStage {

        if (bidAmount < maxBid)
            revert NotValidBid(maxBid, bidAmount);

        bids[msg.sender] = Bid(bidAmount, block.timestamp);
        maxBid = bidAmount;

        emit NewBid(msg.sender, bidAmount);
    }


    function getBid(address bidder) public view returns (Bid memory) {
        return bids[bidder];
    }
}