// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8;

contract OptimizedContract {
	function loop(uint256[] memory items) public pure returns (uint256) {
		uint256 sum = 0;
		uint256 len = items.length;
		for (uint256 i = len; i > 0; ) {
			unchecked { --i; }
			sum += items[i];
		}
		return sum;
	}

	function loopByAssembly(uint256[] memory items) public pure returns (uint256) {
		uint256 sum;
		assembly {
			// 内存数组布局：第一个 32 字节存储数组长度，然后是元素
			// items 是指向数组的指针
			let len := mload(items) // 读取数组长度
			let dataPtr := add(items, 0x20) // 跳过长度字段，即数据起始位置

			// 从后往前遍历，避免每次循环比较长度
			for { let i := len } gt(i, 0) { i := sub(i, 1) } {
				// 计算元素位置：dataPtr + (i-1) * 32
				let index := sub(i, 1)
				let elementPtr := add(dataPtr, mul(index, 0x20))
				let elementValue := mload(elementPtr)
				sum := add(sum, elementValue)
			}
		}
		return sum;
	}

	function multiplyBy16(uint256 x) public pure returns (uint256) {
		return x << 4;
	}
}
