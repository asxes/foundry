// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Stake {
    //IERC20 token;
    error stakeFailed();

    mapping(address => uint256) public s_balances;

    function StakeToken(uint256 amount, address token) public returns (bool) {
        s_balances[msg.sender] += amount;

        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);

        if (!success) revert stakeFailed();

        return true;
    }

    function balance(address _sender) public view returns (uint256) {
        return s_balances[_sender];
    }
}
