// RoboticaToken.sol



pragma solidity ^0.4.21;

import './SafeMath.sol';
import './StandardToken.sol';

contract RoboticaToken is StandardToken {

    using SafeMath for uint256;

    string public name = "RoboticaToken";
    string public symbol = "ROB";
    uint8 public decimals = 18;
    uint256 public totalSupply = 100000000000000000000000000;

    function RoboticaToken() public {
        balances[msg.sender] = totalSupply;
        emit Transfer(0x0, msg.sender, totalSupply);
    }

    function vote(uint256 _token, address _to) public {
        require(balances[msg.sender] >= _token);
        require(!voted[msg.sender]);

        balances[msg.sender] -= _token;
        voted[msg.sender] = true;
        tokens[_to] += _token;

        emit Transfer(msg.sender, _to, _token);
    }

    function voteResult(address _winner) public view returns (uint256) {
        return tokens[_winner];
    }
}