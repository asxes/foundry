// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../src/Stake.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("MockERC20", "MERC") {
        _mint(msg.sender, 1000000e18);
    }
}
