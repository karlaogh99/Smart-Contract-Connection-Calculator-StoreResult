// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.24;

import "./IStoreResult.sol";

/// @title Arithmetic Calculator that interacts with StoreResult
contract Calculator {
    address public admin;
    IStoreResult public store;

    event ResultCalculated(uint256 result);
    event FeeChanged(uint256 newFee);

    constructor(address storeAddress) {
        admin = msg.sender;
        store = IStoreResult(storeAddress);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can execute");
        _;
    }

    modifier feeBounds(uint256 fee_) {
        require(fee_ >= 1 && fee_ <= 100, "Fee must be 1-100");
        _;
    }

    /// @notice Adds two numbers and stores the result
    function sumValues(uint256 a, uint256 b) external {
        uint256 sum = a + b;
        store.updateResult(sum);
        emit ResultCalculated(sum);
    }

    /// @notice Multiplies two numbers (restricted to admin)
    function multiplyValues(uint256 a, uint256 b) external onlyAdmin {
        uint256 product = a * b;
        store.updateResult(product);
        emit ResultCalculated(product);
    }

    /// @notice Updates the fee in StoreResult (must be within bounds)
    function changeFee(uint256 newFee_) external feeBounds(newFee_) {
        store.setFee(newFee_);
        emit FeeChanged(newFee_);
    }
}
