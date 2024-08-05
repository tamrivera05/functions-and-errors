// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract OwnershipContract {
    struct Owner {
        address addr;
        bool isOwner;
    }
    Owner public owner;
    bool public isActive;

    constructor() {
        owner = Owner({addr: msg.sender, isOwner: true});
        isActive = false;
    }

    modifier onlyOwner {
        require(msg.sender == owner.addr && owner.isOwner, "Only the owner can access.");
        _;
    }

    function activate() public onlyOwner {
        require(!isActive, "Contract is already active");
        isActive = true;
    }

    function deactivate() public onlyOwner {
        require(isActive, "Contract is already inactive");
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
        if (msg.sender != owner.addr) {
            revert("Ownership is not valid.");
        }
        assert(msg.sender == owner.addr && owner.isOwner);
    }
}