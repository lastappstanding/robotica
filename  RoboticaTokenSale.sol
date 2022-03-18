// RoboticaTokenSale.sol



pragma solidity ^0.4.21;

import './RoboticaToken.sol';
import './StandardToken.sol';

contract RoboticaTokenSale is StandardToken {

    RoboticaToken public token;
    uint256 public rate;
    uint256 public weiRaised;

    function RoboticaTokenSale(RoboticaToken _token, uint256 _rate) public {
        require(_rate > 0);
        require(_token != 0x0);

        token = _token;
        rate = _rate;
    }

    function buyTokens(uint256 _token) public payable {
        require(msg.value == _token * rate);
        require(balances[token] >= _token);

        balances[token] -= _token;
        balances[msg.sender] += _token;
        weiRaised += msg.value;

        emit Transfer(token, msg.sender, _token);
    }

    function endSale() public {
        require(balances[token] == 0);

        emit Transfer(this, msg.sender, weiRaised);
    }
}