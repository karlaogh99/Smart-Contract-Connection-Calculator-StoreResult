# 🔗 Smart Contract Connection: Calculator & StoreResult

This project demonstrates how two Solidity smart contracts can communicate through an interface, using a **calculator contract** (`Calculator.sol`) and a **result storage contract** (`StoreResult.sol`).

---

## ✨ Overview

This project performs basic arithmetic operations and stores results on-chain by using a secondary smart contract. It also includes access control and fee management features.

---

## 📁 Contracts & Responsibilities

### `StoreResult.sol`

- Stores the result of arithmetic operations.
- Allows updating of result and fee.
- Restricts fee updates to the `feeManager`.

### `Calculator.sol`

- Performs arithmetic operations.
- Calls `updateResult()` and `setFee()` in the external contract `StoreResult`.
- Restricts multiplication to the contract `admin`.
- Validates fee range before sending it to `StoreResult`.

### `IStoreResult.sol`

- Interface contract to abstract the functions of `StoreResult`.
- Declares `updateResult(uint256)` and `setFee(uint256)`.

---

## 🧩 Features

| Feature                | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| Contract Interaction   | Calculator interacts with StoreResult through an interface.                |
| Arithmetic Operations  | Supports addition and restricted multiplication.                           |
| Fee Management         | Admin can update fees with bounds check.                                   |
| Access Control         | Only `admin` can multiply or change fees.                                  |
| Events                 | Emits events on result updates and fee changes.                            |

---

## 🚀 How to Deploy (Using Remix)

1. Open [Remix IDE](https://remix.ethereum.org).
2. Create 3 files:
   - `Calculator.sol`
   - `StoreResult.sol`
   - `IStoreResult.sol`
3. Compile all contracts using Solidity version `0.8.24`.
4. Deploy `StoreResult.sol` and copy its address.
5. Deploy `Calculator.sol` using the address from step 4.
6. Interact with the functions:
   - `sumValues(uint256, uint256)`
   - `multiplyValues(uint256, uint256)` (admin only)
   - `changeFee(uint256)` (with range 1–100)
   - Check stored value: call `storedValue()` from `StoreResult`

---

## 🧪 Example Workflow

1. Deploy `StoreResult.sol`
2. Deploy `Calculator.sol` with address of `StoreResult`
3. Run `sumValues(5, 10)` → `storedValue` becomes `15`
4. Run `multiplyValues(2, 4)` (as admin) → `storedValue` becomes `8`
5. Run `changeFee(25)` → updates fee if within range

---

## ⚖️ License

This project is licensed under the [LGPL-3.0-only](https://opensource.org/licenses/LGPL-3.0).
