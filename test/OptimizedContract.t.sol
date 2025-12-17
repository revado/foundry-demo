// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";

import {OptimizedContract} from "../src/OptimizedContract.sol";

contract OptimizedContractTest is Test {
    OptimizedContract public oc;

    function setUp() public {
        oc = new OptimizedContract();
    }

	// 测试大数组的情况
    function test_Loop_LargeArray() public view {
        uint256[] memory items = new uint256[](100);
        uint256 expectedSum = 0;
        for (uint256 i = 0; i < 100; i++) {
            items[i] = i;
            expectedSum += i;
        }
        uint256 result = oc.loop(items);
        assertEq(result, expectedSum);
    }

	// 测试大数组的情况
	function test_LoopAssembly_LargeArray() public view {
		uint256[] memory items = new uint256[](100);
		uint256 expectedSum = 0;
		for (uint256 i = 0; i < 100; i++) {
			items[i] = i;
			expectedSum += i;
		}
		uint256 result = oc.loopByAssembly(items);
		assertEq(result, expectedSum);
	}

	function test_MultiplyBy16() public view {
		uint256 result = oc.multiplyBy16(1);
		assertEq(result, 16);

		result = oc.multiplyBy16(1239804054054333);
		assertEq(result, 19836864864869328);
	}

	function test_add() public view {
		uint256 x = 55;
		uint256 y = 19836864864869328;
		assertEq(oc.add(x, y), 19836864864869383);
	}
}