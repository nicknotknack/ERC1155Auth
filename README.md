## 🔐 `ERC1155Auth` – Token-Based Authentication

**ERC1155Auth** – educational smart contract uses ERC1155 tokens to authorize actions — enabling new types of permission systems for dApps. Built with **Solidity** and the **Foundry** during [Solidity Bootcamp](https://bootcamp.solidity.university/).  

`ERC1155Auth.sol`–custom smart contract solution that implements token-based authentication  
`AuthTest.sol`–shows how `ERC1155Auth.sol` can be used for authentification  
`./test/*`–tests for `ERC1155Auth.sol`  
`./script/*`–deployment and regular scripts for ERC1155Auth contracts

---

## 🚀 Getting Started

```bash
gh repo clone SolidityUniversity/ERC1155Auth
cd ERC1155Auth
forge install
forge build
```

---

## 📦 Scripts

‼️ Prepare your `.env` according `example.env`

### 1. Deploy `ERC1155Auth`

Deploys the core ERC-1155 authentication contract.

`forge script script/ERC1155AuthDeploy.s.sol:ERC1155AuthDeploy \
  --broadcast \
  --rpc-url wss://base-sepolia.drpc.org \
  --verify \
  --verifier etherscan \
  --etherscan-api-key $ETHERSCAN_API_KEY`

### 2. Deploy `AuthTest`

`forge script script/AuthTestDeploy.s.sol:AuthTestDeploy \
  --broadcast \
  --rpc-url wss://base-sepolia.drpc.org \
  --verify \
  --verifier etherscan \
  --etherscan-api-key $ETHERSCAN_API_KEY
`

### 3. Grant Minter Role

`forge script script/ERC1155GrantMinterRole.s.sol:ERC1155GrantMinterRole \
  --broadcast \
  --rpc-url https://sepolia.base.org \
  --sig "run(address)" <MINTER_ADDRESS>
`

### 4. Mint Token

`forge script script/ERC1155Mint.s.sol:ERC1155Mint \
  --broadcast \
  --rpc-url https://sepolia.base.org \
  --sig "run(address,uint256,string)" <TO_ADDRESS> <TOKEN_ID> "<URI>"
`
  Example: `forge script script/ERC1155Mint.s.sol:ERC1155Mint \
  --broadcast \
  --rpc-url https://sepolia.base.org \
  --sig "run(address,uint256,string)" 0xRecipientAddress 10 "ipfs://example/metadata.json"
`

---

Feel free to contribute or open issues to improve the project 💡

Created with 💕 by 🎓 [Solidity University](https://solidity.university)
