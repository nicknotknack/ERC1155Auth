// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {IERC1155Auth} from "./IERC1155Auth.sol";
import {Roles} from "./Roles.sol";

contract ERC1155Auth is IERC1155Auth, ERC1155, AccessControl {

    constructor() ERC1155("000") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    uint256 public currentTokenId = 0;

    mapping(uint256 => string) private _tokenURIs;

    // ПОЗВОЛЯЕТ СМИНТИТЬ 1 ТОКЕН С КАСТОМНЫЙ ТОКЕН URI
    function mint(address account, uint256 amount, string memory _tokenUri)
        public
        onlyRole(Roles.MINTER_ROLE)
    {
        uint256 newTokenId = currentTokenId;
        currentTokenId++;

        _mint(account, newTokenId, amount, "");
        _tokenURIs[newTokenId] = _tokenUri;
    }

    function updateTokenUri(uint256 _tokenId, string memory _newTokenUri) external onlyRole(Roles.MANAGER_ROLE) {
        _tokenURIs[_tokenId] = _newTokenUri;
    }

    function hasToken(address _user, uint256 _tokenId) external view returns(bool) {
        return balanceOf(_user, _tokenId) > 0;
    }

    function uri(uint256 _tokenId) public view override returns (string memory) {
        return _tokenURIs[_tokenId];
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
