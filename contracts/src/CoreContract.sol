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
    string[] private countriesToIterate;

    constructor(
        address[] memory _allowedToVote,
        uint256 _neededVoteToAllow,
        address _fakeWorldCoin
    ) {
        allowedToVote = _allowedToVote;
        neededVoteToAllow = _neededVoteToAllow;
        fakeWorldCoin = _fakeWorldCoin;
    }

    function submitRequirement(SubmitMeRequirement memory _submitRequirement)
        public
    {
        SubmitRequirement memory submitRequirement = SubmitRequirement(
            _submitRequirement.videoUrl,
            false,
            _submitRequirement.countries
        );

        for (uint256 i = 0; i < _submitRequirement.countries.length; i++) {
            string memory country = _submitRequirement.countries[i];

            VotingPower votingPower = countries[country];

            votingPower.submitRequirement(msg.sender, submitRequirement);
        }
    }

    function getCountries() public view returns (string[] memory) {
        return countriesToIterate;
    }

    function vote(
        string memory _country,
        address _addressToVote,
        bool _vote
    ) public {
        VotingPower votingPower = countries[_country];
        require(
            address(votingPower) != address(0),
            "The country does not exist"
        );

        votingPower.vote(msg.sender, _addressToVote, _vote);
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
            fakeWorldCoin,
            _country
        );
        countries[_country] = votinPower;
        countriesToIterate.push(_country);
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
