const hre = require("hardhat");

async function sleep(ms) {
    return new Promise((resolver) => setTimeout(resolver, ms));
}

async function main(){

    // get the address of deployer account and show it's address and balance
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.provider.getBalance(deployer.address)).toString());

    // deploy the contract "ERC-20.sol"
    const erc20Basic = await hre.ethers.getContractFactory("ERC20Basic");
    const deployedContract = await erc20Basic.deploy(hre.ethers.parseEther("1000"));

    await deployedContract.waitForDeployment();

    // show deployed contract's address
    console.log("Deployed ERCC20 contract address:", deployedContract.target);


    // add a 45s delay between the contract finishing deployment and trying to verify on Etherscan
    await sleep(45000);

    // verify
    await hre.run("verify:verify", {
        address: deployedContract.target,
        constructorArguments: [hre.ethers.parseEther("1000")],
    });

    // get balance of the deployer/owner
    //let balance = BigInt(await deployedContract.balanceOf('0x041e61175A7822ac35611BE9F01Cd3bd53F8dF4f'));
    //let balance = BigNumber.from(v1);
    //let balance = ethers.formatEther(await deployedContract.balanceOf(deployer.address));
    //console.log("Balance of Owner:", balance);

    await deployedContract.transfer('0x2a61990aeff5034961B6aAbdcFe61402d9aC8845', hre.ethers.parseEther("300"))
};

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});