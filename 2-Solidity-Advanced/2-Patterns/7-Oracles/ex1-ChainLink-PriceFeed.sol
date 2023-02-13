// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceFeedConsumer {

    AggregatorV3Interface internal priceFeed;

    constructor() {}

    /*
        Price Feed Aggregator address
            https://docs.chain.link/data-feeds/price-feeds/addresses/

            Goerli Aggregators: 
            ETH/USD     :   0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e - Decimals: 8   
            BTC/ETH     :   0x779877A7B0D9E8603169DdbD7836e478b4624789 - Decimals: 18
            BTC/USD     :   0xA39434A63A52E749F02807ae27335515BA4b07F7 - Decimals: 8
            EUR/USD     :   0x44390589104C9164407A0E0562a9DBe6C24A0E05 - Decimals: 8
            USDC/USD    :   0xAb5c49580294Aff77670F839ea425f5b78ab3Ae7 - Decimals: 8
            XAU/USD     :   0x7b219F57a8e9C7303204Af681e9fA69d17ef626f - Decimals: 18

            Latest prices:
            ETH/USD  : 148228092614             ----- / 1e8 ----->  1 ETH = 1482.28092614 USD
            BTC/ETH  : 14566796020000000000     ----- / 1e18 ---->  1 BTC = 14.566796020000000000 ETH
            BTC/USD  : 2164422000145            ----- / 1e8 ----->  1 BTC = 21644.22000145 USD
            EUR/USD  : 106895100                ----- / 1e8 ----->  1 EUR = 1.06895100 USD
            USDC/USD : 99990000                 ----- / 1e8 ----->  1 USDC = 0.99990000 USD
            XAU/USD  : 1859119999000000000000   ----- / 1e18 ---->  1 XAU = 1859.119999000000000000 USD
    */
    function getLatestPrice(address priceFeed) public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = AggregatorV3Interface(priceFeed).latestRoundData();
        return price;
    }


    /*
        get price scaled to arbitrary decimal
        Example : get price of XAU/ETH
          _base  : XAU/USD - 0x7b219F57a8e9C7303204Af681e9fA69d17ef626f - 1859119999000000000000 - Decimals: 18 - 1859.119999000000000000
          _quote : ETH/USD - 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e - 148228092614           - Decimals: 8  - 1482.28092614
          _scaledToDecimals : 18
          scaledPrice = 1250287880605501239 ~ 1.250287880605501239
    */
    function getScaledPrice(address _base, address _quote, uint8 _scaledToDecimals) public view returns (int256) {

        require(_scaledToDecimals > uint8(0) && _scaledToDecimals <= uint8(18), "Invalid _decimals");

        int256 scaledToDecimals = int256(10 ** uint256(_scaledToDecimals));

        int256 basePrice = getLatestPrice(_base);
        uint8 baseDecimals = getDecimal(_base);
        basePrice = scalePrice(basePrice, baseDecimals, _scaledToDecimals);

        int256 quotePrice = getLatestPrice(_quote);
        uint8 quoteDecimals = getDecimal(_quote);
        quotePrice = scalePrice(quotePrice, quoteDecimals, _scaledToDecimals);

        return (basePrice * scaledToDecimals) / quotePrice;
    }


    function getDecimal(address AggregatorAddress) public view returns (uint8 decimals) {
        decimals = AggregatorV3Interface(AggregatorAddress).decimals();
    }


    function scalePrice(int256 _price, uint8 _priceDecimals, uint8 _scaledToDecimals) public pure returns (int256 scaledPrice) {

        if (_priceDecimals < _scaledToDecimals)
            scaledPrice = _price * int256(10 ** uint256(_scaledToDecimals - _priceDecimals));

        else if (_priceDecimals > _scaledToDecimals)
            scaledPrice = _price / int256(10 ** uint256(_priceDecimals - _scaledToDecimals));

        else
            scaledPrice = _price;
    }

}