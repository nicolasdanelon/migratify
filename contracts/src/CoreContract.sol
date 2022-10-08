// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "./VotingPower.sol";

struct SubmitMeRequirement {
    string videoUrl;
    string[] countries;
}

contract CoreContract {
    mapping(string => VotingPower) public countries;
    uint256 public neededVoteToAllow;
    address[] public allowedToVote;
    address fakeWorldCoin;

    constructor(
        address[] memory _allowedToVote,
        uint256 _neededVoteToAllow,
        address _fakeWorldCoin
    ) {
        allowedToVote = _allowedToVote;
        neededVoteToAllow = _neededVoteToAllow;
        fakeWorldCoin = _fakeWorldCoin;
    }

    function submitRequirement(
        address _fromRequirement,
        SubmitMeRequirement memory _submitRequirement
    ) public {
        SubmitRequirement memory submitRequirement = SubmitRequirement(
            _submitRequirement.videoUrl,
            false,
            _submitRequirement.countries
        );

        for (uint256 i = 0; i < _submitRequirement.countries.length; i++) {
            string memory country = _submitRequirement.countries[i];

            VotingPower votingPower = countries[country];

            votingPower.submitRequirement(_fromRequirement, submitRequirement);
        }
    }

    function addNewCountry(string memory _country) public {
        require(
            address(countries[_country]) == address(0),
            "You have already added this country"
        );
        uint256 neededVoteToAllow = 3;
        VotingPower votinPower = new VotingPower(
            allowedToVote,
            neededVoteToAllow,
            fakeWorldCoin
        );
        countries[_country] = votinPower;
    }

    function checkAllowed(
        string memory _country,
        string memory _biometricalData
    ) public returns (bool) {
        VotingPower votingPower = countries[_country];
        require(
            address(votingPower) != address(0),
            "The country is not in the list"
        );
        return votingPower.allowed(_biometricalData);
    }
}
