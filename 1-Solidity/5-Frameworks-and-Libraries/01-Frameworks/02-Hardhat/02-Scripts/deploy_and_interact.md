# 1. create ‘scripts’ folder
create a new folder in your project, call it `scripts`

# 2. CREATE SCRIPT FILE
inside the `scripts` folder, create a new file called `deploy.js`

Paste the following code into the `deploy.js` file, then save your changes. 

async function main() {

    // 1. Deploys your compiled smart contract

    const [deployer] = await ethers.getSigners();

    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );

    console.log("Account balance:", (await deployer.getBalance()).toString());


    // 2. Obtains the deployed smart contract 

    const MyFirstContract = await ethers.getContractFactory("MyFirstContract");
    const deployedContract = await MyFirstContract.deploy();
    console.log("Deployed MyFirstContract contract address:", deployedContract.address);

    // 3. calls the `setNumber` function
    await deployedContract.setNumber(7)

    // 4. Calls the `getNumber` function
    let result = BigInt(await deployedContract.getNumber()).toString()
    console.log('Stored value in contract is: ', result)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });


# 3. execute script file
npx hardhat run scripts/deploy.js