async function main() {
    console.log("Getting artifacts together");
    const PriceArtifact = await ethers.getContractFactory("PriceConsumerV3")
    
    console.log("Deploying...");
    const priceCons = await PriceArtifact.deploy();
    await priceCons.deployed();
    
    console.log(`ProceConsumerV3 deployed to: ${priceCons.address}`);
    
    ethPrice = await priceCons.getLatestPrice()
    console.log(`Price data for ETH: ${(ethPrice / Math.pow(10, 8)).toString()}$`);
}

// We recommend this pattern to be able to use async/await everywhere and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error)
        process.exit(1)
    })