// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.24;

/// @title Contract to store and manage arithmetic results and fee
contract StoreResult {
    uint256 public storedValue;
    uint256 public fee;
    address public feeManager;

    event ValueUpdated(uint256 newValue);
    event FeeUpdated(uint256 newFee);

    constructor() {
        feeManager = msg.sender;
    }

    /// @notice Updates the stored result value
    function updateResult(uint256 num_) external {
        storedValue = num_;
        emit ValueUpdated(num_);
    }

    /// @notice Updates the fee (only feeManager)
    function setFee(uint256 newFee_) external {
        require(msg.sender == feeManager, "Unauthorized");
        require(newFee_ >= 1 && newFee_ <= 100, "Fee out of bounds");
        fee = newFee_;
        emit FeeUpdated(newFee_);
    }
}
