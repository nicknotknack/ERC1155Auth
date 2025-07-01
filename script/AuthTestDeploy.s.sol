// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {AuthTest} from "../src/AuthTest.sol";

contract AuthTestDeploy is Script {

    function run() public {

        uint256 deployPrivateKey = vm.envUint("DEPLOYER_KEY");
        address erc1155auth = vm.envAddress("CONTRACT_ADDRESS");

        vm.startBroadcast(deployPrivateKey);

        AuthTest auth = new AuthTest(erc1155auth);

        console.log("AuthTest deployed: ", address(auth));
    }

}

//forge script script/AuthTestDeploy.s.sol:AuthTestDeploy --broadcast --rpc-url wss://base-sepolia.drpc.org --verify --verifier etherscan --etherscan-api-key $ETHERSCAN_API_KEY