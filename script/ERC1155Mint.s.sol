// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {ERC1155Auth} from "../src/ERC1155Auth.sol";
import {Roles} from "../src/Roles.sol";

contract ERC1155Mint is Script {
    function run(address _to, uint256 _amount, string memory _tokenUri) public {
        uint256 minterPrivateKey = vm.envUint("MINTER_KEY");

        vm.startBroadcast(minterPrivateKey);

        address contractAddress = vm.envAddress("CONTRACT_ADDRESS");

        ERC1155Auth keyToken = ERC1155Auth(contractAddress);

        keyToken.mint(_to, _amount, _tokenUri);

        console.log(_amount, "of tokens, succsesfully minted to", _to);
    }
}

//forge script script/ERC1155Mint.s.sol:ERC1155Mint --broadcast --rpc-url https://sepolia.base.org --sig "run(address,uint256,string)" 0xAfd378303EaF596FE90e994B87A55E1ef9eEBdBd 10 "https://remilio.org/remilio/json/979"
