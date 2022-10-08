// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "VotingPower.sol";

contract CoreContract {
    mapping(string => VotingPower) public countries;
    uint256 public neededVoteToAllow;
    address[] public allowedToVote;

    constructor(address[] memory _allowedToVote, uint256 _neededVoteToAllow) {
        allowedToVote = _allowedToVote;
        neededVoteToAllow = _neededVoteToAllow;
    }

    function addNewCountry(string memory _country) public {
        require(
            address(countries[_country]) == address(0),
            "You have already added this country"
        );
        uint256 neededVoteToAllow = 3;
        VotingPower votinPower = new VotingPower(
            allowedToVote,
            neededVoteToAllow
        );
        countries[_country] = votinPower;
    }

    function checkAllowed(string memory _country, address _toCheck)
        public
        returns (bool)
    {
        // Subit hash biometrico y no address

        VotingPower votingPower = countries[_country];
        require(
            address(votingPower) != address(0),
            "The country is not in the list"
        );
        return votingPower.allowed(_toCheck);
    }
}
