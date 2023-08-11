
const hre = require("hardhat");

async function main() {
  const maxSupply = 100000000;
  const reward = 50;
  const zataxToken = await hre.ethers.deployContract("ZataxToken",[maxSupply,reward]);
  await zataxToken.waitForDeployment();

  // console.log(zataxToken.address);
  // console.log(zataxToken.address());
  console.log(zataxToken);

  console.log("Deployed Contract Address is ",zataxToken.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
