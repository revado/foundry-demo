// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";

import {UnoptimizedContract} from "../src/UnoptimizedContract.sol";

contract UnoptimizedContractTest is Test {
    UnoptimizedContract public uc;

    function setUp() public {
        uc = new UnoptimizedContract();
    }

	// 测试大数组的情况
    function test_Loop_LargeArray() public view {
        uint256[] memory items = new uint256[](100);
        uint256 expectedSum = 0;
        for (uint256 i = 0; i < 100; i++) {
            items[i] = i;
            expectedSum += i;
        }
        uint256 result = uc.loop(items);
        assertEq(result, expectedSum);
    }

	// 测试大数组的情况
	function test_LoopAssembly_LargeArray() public view {
        // 测试大数组的情况
        uint256[] memory items = new uint256[](100);
        uint256 expectedSum = 0;
        for (uint256 i = 0; i < 100; i++) {
            items[i] = i;
            expectedSum += i;
        }
        uint256 result = uc.loop(items);
        assertEq(result, expectedSum);
	}

	function test_MultiplyBy16() public view {
		uint256 result = uc.multiplyBy16(1);
		assertEq(result, 16);

		result = uc.multiplyBy16(1239804054054333);
		assertEq(result, 19836864864869328);
	}
}