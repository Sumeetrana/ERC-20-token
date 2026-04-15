// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // total supply of tokens
    function totalSupply() external view returns (uint256);

    // balance of a particular account
    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    // allowing someone to use our tokens
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    // approving someone to use our tokens
    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);
}

contract CodeEater is IERC20 {
    address public founder;
    uint public totalSupply = 1000; // number of tokens
    mapping(address => uint) public balanceOfUser;
    mapping(address => mapping(address => uint)) public allowedTokens;

    constructor() {
        founder = msg.sender;
        balanceOfUser[founder] = totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balanceOfUser[account];
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0), "Invalid address");
        require(balanceOfUser[msg.sender] >= value, "Insufficient balance");
        balanceOfUser[msg.sender] -= value;
        balanceOfUser[to] += value;
        return true;
    }

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256) {
        return allowedTokens[owner][spender];
    }
}
