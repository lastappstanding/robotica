// Wallet.sol



pragma solidity ^0.4.21;

import './StandardToken.sol';

contract Wallet is StandardToken {

    string public name = "Wallet";
    string public symbol = "WAL";
    uint8 public decimals = 18;
    uint256 public totalSupply = 100000000000000000000000000;

    function Wallet() public {
        balances[msg.sender] = totalSupply;
        emit Transfer(0x0, msg.sender, totalSupply);
    }
}