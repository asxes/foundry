// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Stake.sol";
import "../src/MockERC20.sol";

contract StakeTest is Test {
    Stake public stake;
    MockERC20 public token_;
    uint256 public amount = 100e18;

    function setUp() public {
        stake = new Stake();
        token_ = new MockERC20();
    }

    function testStakeToken() public {
        token_.approve(address(stake), amount);

        bool stakeledi = stake.StakeToken(amount, address(token_));

        assertTrue(stakeledi);
    }

    function testBalance() public {
        vm.prank(address(2));
        token_.approve(address(stake), amount);
        token_.transfer(address(2), 1e18);
        vm.prank(address(2));
        stake.StakeToken(1e18, address(token_));

        uint256 balance_ = stake.balance(address(2));
        assertEq(balance_, 1e18);
    }
}
