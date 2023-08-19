async function main(){

    // get the address of deployer account
    const [deployer] = await ethers.getSigners();

    // show the deployer account's address
    console.log("Deploying contracts with the account:", deployer.address);

    // show the deployer account's balance
    console.log("Account balance:", (await deployer.provider.getBalance(deployer.address)).toString());

    // deploy the contract "MyFirstContract.sol"
    const deployedContract = await ethers.deployContract("MyFirstContract");
    await deployedContract.waitForDeployment();

    // show deployed contract's address
    console.log(
        "Deployed MyFirstContract contract address:", 
        await deployedContract.target //await deployedContract.getAddress();
    ) 

    // call the setMessage() function
    await deployedContract.setMessage("Hello Hardhat!");

    // call the getMessage() function and show it's result by console.log
    let msg = await deployedContract.getMessage();

    console.log('Stored value in contract is:', msg.toString());
        
};

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});