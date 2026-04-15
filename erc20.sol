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
    uint public totalSupply = 1000; // number of tokens    
}