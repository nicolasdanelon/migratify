// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/VotingPower.sol";

contract VotingPowerTest is Test {
    address voting1 = address(0);
    address voting2 = address(1);
    address voting3 = address(2);
    address me = address(3);
    VotingPower public votingPower;
    uint256 public neededVoteToAllow;

    function setUp() public {
        neededVoteToAllow = 2;
        address[] memory votingPowerAddresses = new address[](3);
        votingPowerAddresses[0] = voting1;
        votingPowerAddresses[1] = voting2;
        votingPowerAddresses[2] = voting3;
        votingPower = new VotingPower(votingPowerAddresses, neededVoteToAllow);
    }

    // function testSubmitRequirement() public {
    //     SubmitRequirement memory requirement = SubmitRequirement("", true);
    //     votingPower.submitRequirement(me, requirement);
    // }

    // function testVote() public {
    //     vm.prank(me);

    //     SubmitRequirement memory requirement = SubmitRequirement(
    //         "https://algo.com",
    //         true
    //     );
    //     votingPower.submitRequirement(me, requirement);
    //     vm.prank(voting1);
    //     votingPower.vote(me, true);
    // }

    function testAllowed() public {
        vm.prank(me);

        SubmitRequirement memory requirement = SubmitRequirement(
            "https://algo.com",
            true
        );

        votingPower.submitRequirement(me, requirement);

        vm.prank(voting1);
        votingPower.vote(me, true);

        vm.prank(voting2);
        votingPower.vote(me, true);

        vm.prank(voting3);
        votingPower.vote(me, false);

        assertEq(votingPower.allowed(me), true);
    }
}
