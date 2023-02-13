// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

// An example of a consumer contract that directly pays for each request.

import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";
import "@chainlink/contracts/src/v0.8/VRFV2WrapperConsumerBase.sol";

/**
 * Request testnet LINK and ETH here: https://faucets.chain.link/
 * Find information on LINK Token Contracts and get the latest ETH and LINK faucets here: https://docs.chain.link/docs/link-token-contracts/
 */

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES HARDCODED VALUES FOR CLARITY.
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

contract VRFv2DirectFundingConsumer is VRFV2WrapperConsumerBase, ConfirmedOwner {

    event RequestSent(uint256 requestId, uint32 numWords);
    event RequestFulfilled(uint256 requestId, uint256[] randomWords, uint256 payment);

    struct RequestStatus {
        uint256 paid; // amount paid in link
        bool fulfilled; // whether the request has been successfully fulfilled
        uint256[] randomWords;
    }
    // requestId --> requestStatus
    mapping(uint256 => RequestStatus) public s_requests; 

    // past requests Id.
    uint256[] public requestIds;
    uint256 public lastRequestId;

    // Depends on the number of requested values that you want sent to the
    // fulfillRandomWords() function. Test and adjust
    // this limit based on the network that you select, the size of the request,
    // and the processing of the callback request in the fulfillRandomWords()
    // function.
    uint32 callbackGasLimit = 100000;

    // The default is 3, but you can set this higher.
    uint16 requestConfirmations = 3;

    // For this example, retrieve 2 random values in one request.
    // Cannot exceed VRFV2Wrapper.getConfig().maxNumWords.
    uint32 numWords = 2;

    uint256 min;
    uint256 max;

    // Address LINK - hardcoded for Goerli
    address linkAddress = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;

    // address WRAPPER - hardcoded for Goerli
    address wrapperAddress = 0x708701a1DfF4f478de54383E49a627eD4852C816;

    constructor() ConfirmedOwner(msg.sender) VRFV2WrapperConsumerBase(linkAddress, wrapperAddress) {}

    
    function setInterval(uint _min, uint _max) public {
        min = _min;
        max = _max;
    }


    // to send the request for random values to Chainlink VRF
    // Remix IDE doesn’t set the right gas limit. 
    // For this example to work, set a gas limit of 400,000
    function requestRandomWords() external onlyOwner returns (uint256 requestId) {

        requestId = requestRandomness(callbackGasLimit, requestConfirmations, numWords);

        s_requests[requestId] = RequestStatus({
            paid: VRF_V2_WRAPPER.calculateRequestPrice(callbackGasLimit),
            randomWords: new uint256[](0),
            fulfilled: false
        });

        requestIds.push(requestId);
        lastRequestId = requestId;

        emit RequestSent(requestId, numWords);
        return requestId;
    }


    /* 
        when the requested random words had been ready,
        oracle returns the random values to your contract by calling fulfillRandomWords() function 
    */
    function fulfillRandomWords(uint256 _requestId, uint256[] memory _randomWords) internal override {

        require(s_requests[_requestId].paid > 0, "request not found");

            // get a random number in a range from "min" to "max"
            // You have to set "min" , "max" via setInterval(), and call it before calling the requestRandomWords()
            // if you don't want that, simply comment following 2 lines
            for(uint i=0; i<_randomWords.length; i++)
                _randomWords[i] = (_randomWords[i] % max) + min;

        s_requests[_requestId].fulfilled = true;
        s_requests[_requestId].randomWords = _randomWords;

        emit RequestFulfilled(_requestId, _randomWords, s_requests[_requestId].paid);
    }


    /*
        lastRequestId() => requestID of your request

                                *** Waiting for random values ***
            After the oracle returns the random values to your contract, the mapping s_requests is updated. 
            The received random values are stored in "s_requests[_requestId].randomWords"
            it might take a few minutes for the callback to return the requested random values to your contract.

        getRequestStatus(_requestId) => display the "random words"
    */
    function getRequestStatus(uint256 _requestId) external view returns (uint256 paid, bool fulfilled, uint256[] memory randomWords) {

        require(s_requests[_requestId].paid > 0, "request not found");

        RequestStatus memory request = s_requests[_requestId];

        return (request.paid, request.fulfilled, request.randomWords);
    }


    /*
        Allow withdraw of Link tokens from the contract
    */
    function withdrawLink() public onlyOwner {

        LinkTokenInterface link = LinkTokenInterface(linkAddress);

        require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
    }
}




/*
    ----------------
    Run
    -----------------

    1. Deploy the VRFv2DirectFundingConsumer

    2. Fund VRFv2DirectFundingConsumer with LINK Token. (https://faucets.chain.link/)

    3. call the "requestRandomWords()" function to send the request for random values to Chainlink VRF. 
        Note: Remix IDE doesn’t set the right gas limit. 
        For this example to work, set a gas limit of 400,000

    4. To fetch the request ID of your request, call "lastRequestId()"
        Ex: 99440127728384319498007479344467888154374567530587929257123447098566467056408 

    5. After the oracle returns the random values to your contract, the mapping s_requests is updated. 
        The received random values are stored in "s_requests[_requestId].randomWords"
        it might take a few minutes for the callback to return the requested random values to your contract.
        after few minutes, Call "getRequestStatus(_requestId)" and specify the requestId to display the "random words".
        
        Ex: randomWords[] = 35247896544343688172710550311178075338522545443371427762979831633407207410139,
                            38632492572344245840875706881068213571861914207807667236715005213067594171074

    7. After you are done with this contract, you can retrieve the remaining testnet LINK to use with other examples.
        Call withdrawLink() function. 
        MetaMask opens and asks you to confirm the transaction. 
        After you approve the transaction, the remaining LINK will be transfered from your consuming contract 
            to your wallet address.
*/