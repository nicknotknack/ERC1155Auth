// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {ERC1155Auth} from "../src/ERC1155Auth.sol";
import {Roles} from "../src/Roles.sol";

contract ERC1155GrantMinterRole is Script {

    function run(address _to) public {
        uint256 deployPrivateKey = vm.envUint("DEPLOYER_KEY");

        vm.startBroadcast(deployPrivateKey);

        address contractAddress = vm.envAddress("CONTRACT_ADDRESS");

        ERC1155Auth keyToken = ERC1155Auth(contractAddress);

        keyToken.grantRole(Roles.MINTER_ROLE, _to);

        console.log("Role MINTER_ROLE granted to:", _to);
    }

}