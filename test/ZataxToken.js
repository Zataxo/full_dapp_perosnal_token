const {expect} = require("chai");
const hre = require("hardhat");
describe("Owner restriction",function(){
    let myToken;
    let owner;
    let addressOne;
    let addressTwo;
    let maxSupply = 100;
    beforeEach(async function(){
        myToken = await hre.ethers.deployContract("PersonalToken",[maxSupply]);
        [owner,addressOne,addressTwo] = await hre.ethers.getSigners();
    });
    it("Should Set The Right Owner",async function(){
        const ownerAddress =await myToken.getOwner();
        expect(ownerAddress).to.equal(owner.address);
    });
    it("Only Owner Should Mint Tokens",async function(){
        await expect(myToken.connect(addressOne).mint(5)).to.be.revertedWith('Only Owner Can Call');         
        const ownerBalanceBefore = await myToken.balanceOf(owner.address);
        await myToken.mint(5);
        const ownerBalanceAfter = await myToken.balanceOf(owner.address);
        expect(Number(hre.ethers.formatEther(ownerBalanceAfter))-Number(hre.ethers.formatEther(ownerBalanceBefore))).to.equal(5);

    });
    it("Owner Should not Mint More Than The Max Supply",async function(){
        await expect(myToken.mint(96)).to.be.revertedWith('Can not exceeds the max supply');
    });
    it("Only Owner Should Burn Tokens",async function(){
        await expect(myToken.connect(addressOne).burn(5)).to.be.revertedWith("Only Owner Can Call");
    })
})
describe("Transactions restriction",function(){
    let myToken;
    let owner;
    let addressOne;
    let addressTwo;
    let maxSupply = 100;
    beforeEach(async function(){
        myToken = await hre.ethers.deployContract("PersonalToken",[maxSupply]);
        [owner,addressOne,addressTwo] = await hre.ethers.getSigners();
    });
    it("Should not Transfer For Zero Address",async function(){
        const invalidAddress = await myToken.getInvalidAddress();
       await expect(myToken.transfer(invalidAddress,5)).to.be.revertedWith('Invaild Address');
    });
    it("Approve Tokens on Behalf Owner Should set Owner's Allowance",async function(){
       await myToken.approve(addressOne.address,3);
       const ownerAllowance = await myToken.allowance(owner.address,addressOne.address);
       expect(Number(hre.ethers.formatEther(ownerAllowance))).to.equal(3);
    });
    it("Sending Tokens on Behalf Owner Should deduct it From The Allowance",async function(){
       await myToken.approve(addressOne.address,3);
    //    const ownerAllowance = await myToken.allowance(owner.address,addressOne.address);
       await myToken.connect(addressOne).transferFrom(owner.address,addressTwo.address,3);
       const addressTwoAmount = await myToken.balanceOf(addressTwo.address);
       expect(Number(hre.ethers.formatEther(addressTwoAmount))).to.equal(3);
 
    });
    it("Should Transfer Between Accounts",async function(){
        await myToken.transfer(addressOne.address,2);
        const ownerAfterAmount = await myToken.balanceOf(owner.address);
        const addressOneBalance = await myToken.balanceOf(addressOne.address);
        expect(Number(hre.ethers.formatEther(addressOneBalance))).to.equal(2)
        expect(Number(hre.ethers.formatEther(ownerAfterAmount))).to.equal(3)
    })
})