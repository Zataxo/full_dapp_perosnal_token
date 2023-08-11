// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "hardhat/console.sol";

interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
contract PersonalToken is IERC20 {
    uint public totalSupply;
    uint public maxSupply;
    mapping(address=>uint) public balanceOf;
    mapping (address=>mapping (address=>uint)) public allowance;
    string public name = "ZataxToken";
    string public symbol = "ZTX";
    uint public deceimals = 18;
    struct Transactions{
        address from;
        address to;
        uint amount;
        string tType;
    }
    Transactions[] public transactions;

    address private owner;
    constructor(uint _cap) {
        owner = msg.sender;
        maxSupply = _cap * (10 ** deceimals);
        mint(5);
    }
    function getOwner() public view returns(address){
        return owner;
    }
    function getTotalSupply() public view returns(uint){
        return totalSupply;
    }
    function getMaxSupply() public view returns(uint){
        return maxSupply;
    }
    function getInvalidAddress() public pure returns(address){
        return address(0);
    }
    

    function transfer(address recipient, uint amount) external returns (bool){
        require(recipient != address(0),"Invaild Address");
        uint amt = amount * (10 ** deceimals);
        balanceOf[msg.sender] -= amt;
        balanceOf[recipient] += amt;
        transactions.push(Transactions({
            from:msg.sender,
            to:recipient,
            amount:amount,
            tType:"Direct"

        }));
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    
    function approve(address spender, uint amount) external returns (bool){
        require(spender != address(0),"Invaild Address");
        uint amt = amount * (10 ** deceimals);
        allowance[msg.sender][spender] = amt;
        emit Approval(msg.sender, spender, amt);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool)
    {
        require(sender != address(0) && recipient != address(0),"Invaild Address");
        uint amt = amount * (10 ** deceimals);
        allowance[sender][msg.sender] -=amt;
        balanceOf[sender] -= amt;
        balanceOf[recipient] += amt;
          transactions.push(Transactions({
            from:sender,
            to:recipient,
            amount:amount,
            tType:"Indirect"

        }));
        emit Transfer(sender, recipient, amt);
        return true;
    }
 
    function mint(uint amount) public onlyOwner {
        uint amt = amount * (10 ** deceimals);
        require((totalSupply + amt) <= maxSupply,"Can not exceeds the max supply");
        balanceOf[owner] += amt;
        totalSupply += amt;
        emit Transfer(address(0), owner, amt);
    }
    function burn(uint amount) external onlyOwner {
        uint amt = amount * (10 ** deceimals);
        balanceOf[owner] -= amt;
        totalSupply -= amt;
        emit Transfer(owner,address(0), amt);
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"Only Owner Can Call");
        _;
    }



}


