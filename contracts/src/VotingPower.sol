// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/console2.sol";
import "forge-std/Test.sol";

struct SubmitRequirement {
    string videoUrl;
    bool subimted;
}

struct Vote {
    address votedBy;
    bool vote;
}

contract VotingPower {
    // devolver lista de videos a votar
    mapping(address => bool) public allowedToVote;
    mapping(address => SubmitRequirement) public requirements;
    mapping(address => Vote[]) public requirementsVoted;

    uint256 public neededVoteToAllow;

    constructor(address[] memory _allowedToVote, uint256 _neededVoteToAllow) {
        for (uint256 i = 0; i < _allowedToVote.length; i++) {
            address allowed = _allowedToVote[i];
            allowedToVote[allowed] = true;
        }
        neededVoteToAllow = _neededVoteToAllow;
    }

    function submitRequirement(
        address _fromRequirement,
        SubmitRequirement memory _submitRequirement
    ) public {
        require(!requirements[_fromRequirement].subimted);
        // Validar que el from es una address valida
        // subit lista de countries
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

    function allowed(address _addressToCheck) public returns (bool) {
        Vote[] memory votes = requirementsVoted[_addressToCheck];
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
