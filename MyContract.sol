// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract MyContract {
    address public owner;
    uint256 internal number;

    constructor(){ owner = msg.sender;}
    
    event NumberUpdated(uint256 newNumber);
    modifier onlyOwner() {
        require(msg.sender == owner, "Maaf anda bukan owner");
        _;
    }

    function getNumber() external view returns(uint256){ return number; }

    function setNumber(uint256 _number) external onlyOwner {
        require(number != _number,"Nomor tidak boleh sama");
        number = _number;
        emit NumberUpdated(_number);
    }
}
