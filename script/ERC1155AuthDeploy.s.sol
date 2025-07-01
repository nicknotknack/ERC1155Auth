// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {ERC1155Auth} from "../src/ERC1155Auth.sol";
import {Roles} from "../src/Roles.sol";

contract ERC1155AuthDeploy is Script {

    function run() public {

        uint256 deployPrivateKey = vm.envUint("DEPLOYER_KEY");

        vm.startBroadcast(deployPrivateKey);

        ERC1155Auth keyToken = new ERC1155Auth();

        console.log("ERC1155Auth deployed: ", address(keyToken));
    }

}

//forge script cript/ERC1155AuthDeploy.s.sol --broadcast --rpc-url https://sepolia.base.org --verify --verifier etherscan --etherscan-api-key AE2B33M5C9CASXWV9M571EPMH8EHQUGASI


//forge script script/ERC1155AuthDeploy.s.sol --fork-url $RPC --broadcast --verify --verifier etherscan --verifier-api-key $VERIFIER_API_KEY --verifier-url "https://api.etherscan.io/v2/api?chainid=84532 --chain-id 84532

//forge verify-contract 0x2280CeF9eE1F2937137DA9c3075A57B7474A9C75 --etherscan-api-key AE2B33M5C9CASXWV9M571EPMH8EHQUGASI --chain 84532 --rpc-url https://base-sepolia-rpc.publicnode.com --verifier etherscan --verifier-url https://api.basescan.org/api

//forge verify-contract 0x2280CeF9eE1F2937137DA9c3075A57B7474A9C75 --etherscan-api-key AE2B33M5C9CASXWV9M571EPMH8EHQUGASI --chain 84532 --rpc-url https://base-sepolia-rpc.publicnode.com --verifier etherscan --verifier-url "https://api.etherscan.io/v2/api?chainid=84532"

//forge script script/ERC1155AuthDeploy.s.sol:ERC1155AuthDeploy --chain 84532 --rpc-url "https://base-sepolia.drpc.org" --broadcast --flatten --verify --verifier etherscan --etherscan-api-key AE2B33M5C9CASXWV9M571EPMH8EHQUGASI

//forge script --chain base-sepolia script/ERC1155AuthDeploy.s.sol:ERC1155AuthDeploy --fork-url "https://base-sepolia.drpc.org" --broadcast --verify --verifier etherscan --etherscan-api-key AE2B33M5C9CASXWV9M571EPMH8EHQUGASI