const { ethers, hardhat } = require("hardhat");


async function main() {
  //   Signer objects for deploying the contract
  const [deployer] = await ethers.getSigners();

  //  Compiling the smart contract
  const SbtContract = await ethers.getContractFactory("sbt");
  const contract = await SbtContract.deploy(graduation_certificates , CFT_GRA);

  // : Waiting for the contract to be deployed and log the address
  await contract.deployed();
  console.log("Contract deployed to address:", contract.address);
}

// Call the main function to deploy the contract
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });