const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("PriceConsumerV3", function() {

    let priceCons;

    beforeEach(async () => {
        let artifact = await ethers.getContractFactory("PriceConsumerV3");
        priceCons = await artifact.deploy();
    })

    it("Should be able successfully get round data and return a valid price for ETH", async function() {
        expect(await priceCons.getLatestPrice()).not.be.null;
    });
});