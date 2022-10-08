// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/console2.sol";
import "forge-std/Test.sol";

struct SubmitRequirement {
    string videoUrl;
    bool subimted;
    string[] countries;
}

struct Vote {
    address votedBy;
    bool vote;
}

interface IFakeWorldCoin {
    function balanceByBiometricalData(string memory _hashOfBiometricalData)
        external
        returns (uint256);

    function biometricalData(string memory _biometricalData)
        external
        returns (address);

    function balanceOf(address owner) external view returns (uint256);
}

contract VotingPower {
    // devolver lista de videos a votar

    mapping(address => bool) public allowedToVote;
    mapping(address => SubmitRequirement) public requirements;
    mapping(address => Vote[]) public requirementsVoted;

    uint256 public neededVoteToAllow;
    IFakeWorldCoin public fakeWorldCoin;

    constructor(
        address[] memory _allowedToVote,
        uint256 _neededVoteToAllow,
        address _fakeWorldCoin
    ) {
        for (uint256 i = 0; i < _allowedToVote.length; i++) {
            address allowed = _allowedToVote[i];
            allowedToVote[allowed] = true;
        }
        neededVoteToAllow = _neededVoteToAllow;
        fakeWorldCoin = IFakeWorldCoin(_fakeWorldCoin);
    }

    function submitRequirement(
        address _fromRequirement,
        SubmitRequirement memory _submitRequirement
    ) public {
        require(!requirements[_fromRequirement].subimted);
        require(
            fakeWorldCoin.balanceOf(_fromRequirement) == 1,
            "This address is not valid"
        );
        requirements[_fromRequirement] = _submitRequirement;
    }

    function vote(address _addressToVote, bool _vote) public {
        require(allowedToVote[msg.sender], "You can't  vote");
        require(
            requirements[_addressToVote].subimted,
            "There is not a requirement from this url"
        );
        Vote memory vote = Vote(msg.sender, _vote);
        requirementsVoted[_addressToVote].push(vote);
    }

    function allowed(string memory _biometricalData) public returns (bool) {
        address addressToCheck = fakeWorldCoin.biometricalData(
            _biometricalData
        );
        Vote[] memory votes = requirementsVoted[addressToCheck];
        uint256 totalCount = 0;
        for (uint256 i = 0; i < votes.length; i++) {
            Vote memory vote = votes[i];
            if (vote.vote) {
                totalCount += 1;
            }
        }
        if (totalCount >= neededVoteToAllow) {
            return true;
        } else {
            return false;
        }
    }
}
