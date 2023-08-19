async function main() {

    // get the address of deployer account
    const [deployer] = await ethers.getSigners();

    // show the deployer account's address
    console.log("Deploying contracts with the account: ", deployer.address);

    // show the deployer account's balance
    console.log("Account balance: ", (await deployer.provider.getBalance(deployer.address)).toString());

    // get the artifact of contract "MyFirstContract.sol"
    const MyFirstContract = await ethers.getContractFactory("MyFirstContract");

    // deploy the contract "MyFirstContract.sol"
    const deployedContract = await MyFirstContract.deploy();

    // show deployed contract's address
    console.log("Deployed MyFirstContract contract address:", deployedContract.address);

    // call the setNumber() function
    //await deployedContract.setNumber(7)

    // call the getNumber() function 
    // and show it's result by console.log
    //let result = await deployedContract.getNumber()
    //console.log('Stored value in contract is: ', result)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });