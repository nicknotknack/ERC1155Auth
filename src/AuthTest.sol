// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.30;

import {IERC1155Auth} from "./IERC1155Auth.sol";

contract AuthTest {
    IERC1155Auth public auth;

    error UserDontHaveToken(uint256 _tokenId);

    mapping(address=>bool) partisipations;

    constructor(address _authAddress) {
        auth = IERC1155Auth(_authAddress);
    }

    function partifipate() external {
        require(auth.hasToken(msg.sender, 1), UserDontHaveToken(1));
        partisipations[msg.sender] = true;
    }
}