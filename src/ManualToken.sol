// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        // return 1000000 * 10 ** decimals();
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        // return super.balanceOf(_owner);
        return s_balances[_owner];
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        require(_to != address(0), "Invalid address");
        require(s_balances[msg.sender] >= _value, "Insufficient balance");

        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;

        require(
            s_balances[msg.sender] + s_balances[_to] == previousBalance,
            "Balance mismatch"
        );
        //     // emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // constructor() ERC20("ManualToken", "MTK") {
    //     _mint(msg.sender, 1000000 * 10 ** decimals());
    // }
}
