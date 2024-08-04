# functions-and-errors
The OwnershipContract is a simple Solidity smart contract that demonstrates basic concepts such as ownership, state management, and access control on the Ethereum blockchain. It allows the owner to activate or deactivate the contract and includes functions for verifying ownership and checking the contract's status.

## Description
The OwnershipContract is designed to handle basic ownership functionality with public variables for the owner's address and the contract's active state. It includes functions to activate and deactivate the contract, as well as to check the contract's status and verify ownership. The contract uses a modifier to restrict certain functions so that only the owner can execute them.

## Getting Started
### Executing the Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix](https://remix.ethereum.org/).

#### Create a New File:
- Click on the "+" icon in the left-hand sidebar.
- Save the file with a .sol extension (e.g., errors.sol).
- Copy and paste the following code into the file:

  ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.17;

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

    ```
#### Compile the Code:
- Click on the "Solidity Compiler" tab in the left-hand sidebar.
- Make sure the "Compiler" option is set to `0.8.17` (or another compatible version).
- Click on the "Compile errors.sol" button.

#### Deploy the Contract:
- Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
- Select the "errors" contract from the dropdown menu.
- Click on the "Deploy" button.

#### Interacting with the Contract
Once the contract is deployed, you can interact with it by calling the `activate`, `deactivate`, `checkStatus`, and `verifyOwner` functions.

## Authors
Tamara Angela Rivera 
[@tamrivera05](https://github.com/tamrivera05)
