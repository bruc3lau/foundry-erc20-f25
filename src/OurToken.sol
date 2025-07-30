// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }
    // mapping(address => uint256) private s_balances;
    // function name() public view returns (string memory) {
    //     return "Manual Token";
    // }
    // function totalSupply() public view returns (uint256) {
    //     return 100 ether;
    // }
    // function decimals() public view returns (uint8) {
    //     return 18;
    // }
    // function balanceOf(address _owner) public view returns (uint256 balance) {
    //     return s_balances[_owner];
    // }
    // function transfer(
    //     address _to,
    //     uint256 _value
    // ) public returns (bool success) {
    //     require(_to != address(0), "Invalid address");
    //     require(s_balances[msg.sender] >= _value, "Insufficient balance");
    //     uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
    //     s_balances[msg.sender] -= _value;
    //     s_balances[_to] += _value;
    //     require(
    //         s_balances[msg.sender] + s_balances[_to] == previousBalance,
    //         "Balance mismatch"
    //     );
    //     // emit Transfer(msg.sender, _to, _value);
    //     return true;
    // }
}
