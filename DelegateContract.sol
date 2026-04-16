// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract CalledContract {
    uint public someNumber;

    function setNumber(uint _num) public {
        someNumber = _num;
    }
}
