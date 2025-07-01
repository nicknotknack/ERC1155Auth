pragma solidity 0.8.30;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {ERC1155Auth} from "../src/ERC1155Auth.sol";
import {Roles} from "../src/Roles.sol";

contract ERC1155AuthTest is Test {
    ERC1155Auth public keyToken;

    address public admin = address(1);
    address public manager = address(2);
    address public minter = address(3);
    address public user1 = address(4);
    address public user2 = address(5);

    function setUp() public {
        vm.startPrank(admin);
        keyToken = new ERC1155Auth();

        keyToken.grantRole(Roles.MINTER_ROLE, minter);
        keyToken.grantRole(Roles.MANAGER_ROLE, manager);
        vm.stopPrank;
    }

    function testDeployment() public {
        vm.startPrank(admin);
        assert(address(keyToken) != address(0));

        assertTrue(keyToken.hasRole((keyToken.DEFAULT_ADMIN_ROLE()), admin));
        assertTrue(keyToken.hasRole(Roles.MINTER_ROLE, minter));
        assertTrue(keyToken.hasRole(Roles.MANAGER_ROLE, manager));

        console.log("ERC1155Auth: ", address(keyToken));
    }

    function testMint() public {
        vm.startPrank(minter);

        string memory tokenUri = "https://anyUri/";

        keyToken.mint(user1, 1, tokenUri);
        vm.stopPrank;

        assertEq(keyToken.balanceOf(user1, 0), 1);
        assertEq(keyToken.uri(0), tokenUri);
    }

    function testUpdateTokenUri() public {
        testMint();

        vm.startPrank(manager);
        string memory newTokenUri = "https://newTokenUri";
        keyToken.updateTokenUri(0, newTokenUri);
        vm.stopPrank;
        assertEq(keyToken.uri(0), newTokenUri);
    }

    function testUserHasToken() public {
        testMint();

        assertTrue(keyToken.hasToken(user1, 0));
    }
}