require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks:{
    sepolia: {
      url:process.env.INFURA_SEPOIL_ENDPOINT,
      accounts:[process.env.PRIVATE_KEY]
    }
  }
};
