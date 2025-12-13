// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8;

contract UnoptimizedContract {
	function loop(uint256[] memory items) public pure returns (uint256) {
		uint256 sum = 0;
		for (uint256 i = 0; i < items.length; i++) {
			sum += items[i];
		}
		return sum;
	}

	function multiplyBy16(uint256 x) public pure returns (uint256) {
		return x * 16;
	}
}
