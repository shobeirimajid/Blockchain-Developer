const hardhat = require("hardhat");

async function main(){

    // get the address of deployer account
    const [deployer] = await ethers.getSigners();

    // show the deployer account's address
    console.log("Deploying contracts with the account: ", deployer.address);

    // show the deployer account's balance
    console.log("Account balance: ", (await deployer.provider.getBalance(deployer.address)).toString());

    // deploy the contract "ERC-20.sol"
    const erc20Basic = await ethers.getContractFactory("ERC20Basic");
    const deployedContract = await erc20Basic.deploy(hardhat.ethers.parseEther("1000"));

    // show deployed contract's address
    console.log("Deployed ERCC20 contract address:", deployedContract.target);

    // get balance of the deployer/owner
    
    //let balance = BigInt(await deployedContract.balanceOf('0x041e61175A7822ac35611BE9F01Cd3bd53F8dF4f'));
    //let balance = BigNumber.from(v1);
    //let balance = ethers.formatEther(await deployedContract.balanceOf(deployer.address));
    //console.log("Balance of Owner:", balance);

    await deployedContract.transfer('0x2a61990aeff5034961B6aAbdcFe61402d9aC8845', hardhat.ethers.parseEther("500"))
};

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});