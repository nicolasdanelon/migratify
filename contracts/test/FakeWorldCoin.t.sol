// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/FakeWorldCoin.sol";

contract FakeWorldCoinTest is Test {
    address me = address(1);
    address other = address(2);
    FakeWorldCoin public fakeWorldCoin;
    uint256 public neededVoteToAllow;
    string biometricalData = "112233";

    function setUp() public {
        fakeWorldCoin = new FakeWorldCoin();
    }

    function testSecureMint() public {
        vm.prank(other);
        fakeWorldCoin.secureMint(me, biometricalData);
        assertEq(fakeWorldCoin.balanceByBiometricalData(biometricalData), 1);
    }

    function testSecureMintReturn0Balance() public {
        vm.prank(other);
        fakeWorldCoin.secureMint(me, biometricalData);
        vm.expectRevert(
            bytes("You have not registered your biometrical information")
        );
        assertEq(fakeWorldCoin.balanceByBiometricalData("vbb"), 0);
    }
}
