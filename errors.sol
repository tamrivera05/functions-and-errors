// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract OwnershipContract {
    address public owner;
    bool public isActive;

    constructor() {
        owner = msg.sender;
        isActive = false;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can access.");
        _;
    }

    function activate() public onlyOwner {
        isActive = true;
    }

    function deactivate() public onlyOwner {
        isActive = false;
    }

    function checkStatus() public view {
        if (isActive == false) {
            revert("The contract is not active.");
        } else {
            revert("The contract is active.");
        }
    }

    function verifyOwner() public view {
        assert(msg.sender == owner);
    }
}