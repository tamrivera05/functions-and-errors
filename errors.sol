// SPDX-License-Identifier: MIT
pragma solidity  0.8.26;

contract MyToken {

    constructor() {
        owner = msg.sender;
    }


    string public tokenName = "TOKEN";
    string public tokenAbbrv = "TKN";
    uint256 public totalSupply = 0;
    address public owner;

    event Mint(address indexed to, uint amount);
    event Burn(address indexed from, uint amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    error insufficientBalance(uint256 balance, uint withdrawAmount);

    mapping(address => uint256) public balances;

    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }


    function burn (address _address, uint256 _value) public ownerOnly{
        if (balances[_address] < _value){
            revert insufficientBalance({balance: balances[_address], withdrawAmount: _value});
        }else{
            totalSupply -= _value;
            balances[_address] -= _value;
            emit Burn(_address, _value);
        }
    }

    function mint (address _address, uint256 _value) public ownerOnly{
        totalSupply += _value;
        balances[_address] += _value;
        emit Mint(_address, _value);
    }

    function transfer (address _receiver, uint _value) public{
        require(balances[msg.sender] >= _value, "Account balance must be greater than transfered value");
        balances[msg.sender] -= _value;
        balances[_receiver] += _value;
        emit Transfer(msg.sender, _receiver, _value);
    }



}