const hre = require("hardhat");

async function sleep(ms) {
    return new Promise((resolver) => setTimeout(resolver, ms));
}

async function main(){

    // get the address of deployer account and show it's address and balance
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.provider.getBalance(deployer.address)).toString());

    // deploy the contract "MyFirstContract.sol"
    const MyFirstContract = await hre.ethers.deployContract("MyFirstContract");

    await MyFirstContract.waitForDeployment();

    // show deployed contract's address
    console.log(`MyFirstContract contract Deployed to: ${MyFirstContract.target}`);

    // call the setMessage() function
    await MyFirstContract.setMessage("Hello Hardhat!");

    // call the getMessage() function and show it's result by console.log
    let msg = await MyFirstContract.getMessage();
    console.log('Stored value in contract is:', msg.toString());

    // add a 45s delay between the contract finishing deployment and trying to verify on Etherscan
    await sleep(45000);

    // verify
    await hre.run("verify:verify", {
        address: MyFirstContract.target,
        constructorArguments: [],
    });
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});