// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract CalledContract {
    uint public someNumber;

    function setNumber(uint _num) public {
        someNumber = _num;
    }
}

contract Caller {
    uint public someNumber; // Note that this is same variable name as CalledContract

    function setNumber(address _calledContractAddress, uint _num) public {
        // Prepare the data to call setNumber(uint) on the Called contract
        bytes memory data = abi.encodeWithSignature("setNumber(uint256)", _num);

        // Perform the delegateCall
        (bool success, ) = _calledContractAddress.delegatecall(data);
        require(success, "Delegatecall failed");
    }
}
