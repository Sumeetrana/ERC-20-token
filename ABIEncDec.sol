// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract AbiEncDec {
    function encodeData(
        uint256 fixedNumber,
        string memory dynamicString,
        uint256[2] memory fixedArray,
        uint256[] memory dynamicArray
    ) public pure returns (bytes memory) {
        return abi.encode(fixedNumber, dynamicString, fixedArray, dynamicArray);
    }

    funtion decodeData(bytes memory data) public pure returns (uint256, string memory, uint256[2] memory, uint256[] memory) {
        (
            uint256 fixedNumber,
            string memory dynamicString,
            uint256[2] memory fixedArray,
            uint256[] memory dynamicArray
        ) = abi.decode(data, (uint256, string, uint256[2], uint256[]));
        return (fixedNumber, dynamicString, fixedArray, dynamicArray);
    }
}
