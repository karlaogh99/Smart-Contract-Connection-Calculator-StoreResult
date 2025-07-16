// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.24;

/// @title Interface for interacting with StoreResult contract
interface IStoreResult {
    function updateResult(uint256 num_) external;
    function setFee(uint256 newFee_) external;
}