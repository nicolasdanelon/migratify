// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.13;

// import "forge-std/Test.sol";
// import "../src/VotingPower.sol";
// import "../src/FakeWorldCoin.sol";
// import "../src/CoreContract.sol";

// contract IntegrationTest is Test {
//     address voting1 = address(1);
//     address voting2 = address(2);
//     address voting3 = address(3);
//     address me = address(4);
//     address other = address(5);

//     VotingPower public votingPower;
//     uint256 public neededVoteToAllow;
//     FakeWorldCoin public fakeWorldCoin;
//     CoreContract public coreContract;

//     function setUp() public {
//         neededVoteToAllow = 2;

//         address[] memory votingPowerAddresses = new address[](3);

//         votingPowerAddresses[0] = voting1;
//         votingPowerAddresses[1] = voting2;
//         votingPowerAddresses[2] = voting3;

//         fakeWorldCoin = new FakeWorldCoin();

//         coreContract = new CoreContract(
//             votingPowerAddresses,
//             neededVoteToAllow,
//             address(fakeWorldCoin)
//         );
//     }

//     function testIntegrationHappyPath() public {
//         string memory biometricalData = "123456789";
//         fakeWorldCoin.secureMint(me, biometricalData);
//         string memory videoUrl = "https://www.algo.algo.com";

//         string[] memory countries = new string[](3);
//         string memory arg = "arg";
//         string memory col = "col";
//         string memory br = "br";
//         countries[0] = arg;
//         countries[1] = col;
//         countries[2] = br;
//         vm.prank(other);

//         coreContract.addNewCountry(arg);
//         coreContract.addNewCountry(col);
//         coreContract.addNewCountry(br);

//         vm.prank(me);

//         SubmitMeRequirement memory submitMeRequirement = SubmitMeRequirement(
//             videoUrl,
//             countries
//         );
//         coreContract.submitRequirement(submitMeRequirement);

//         vm.startPrank(voting1);
//         coreContract.vote(arg, me, true);
//         coreContract.vote(col, me, true);
//         coreContract.vote(br, me, true);

//         vm.stopPrank();
//         vm.startPrank(voting2);
//         coreContract.vote(arg, me, true);
//         coreContract.vote(col, me, true);
//         coreContract.vote(br, me, true);
//         vm.stopPrank();

//         vm.startPrank(voting3);
//         coreContract.vote(arg, me, true);
//         coreContract.vote(col, me, true);
//         coreContract.vote(br, me, false);
//         vm.stopPrank();
//         vm.startPrank(other);

//         bool resultArg = coreContract.checkAllowed(arg, biometricalData);
//         assertEq(resultArg, true);

//         bool resultCol = coreContract.checkAllowed(col, biometricalData);
//         assertEq(resultCol, true);

//         bool resultBr = coreContract.checkAllowed(br, biometricalData);
//         assertEq(resultBr, false);
//     }

//     function testIntegrationGetVideos() public {
//         string memory biometricalData = "123456789";
//         fakeWorldCoin.secureMint(me, biometricalData);
//         string memory videoUrl = "https://www.algo.algo.com";

//         string[] memory countries = new string[](3);
//         string memory arg = "arg";
//         string memory col = "col";
//         string memory br = "br";
//         countries[0] = arg;
//         countries[1] = col;
//         countries[2] = br;
//         vm.prank(other);

//         coreContract.addNewCountry(arg);
//         coreContract.addNewCountry(col);
//         coreContract.addNewCountry(br);

//         vm.prank(me);

//         SubmitMeRequirement memory submitMeRequirement = SubmitMeRequirement(
//             videoUrl,
//             countries
//         );
//         coreContract.submitRequirement(submitMeRequirement);

//         vm.startPrank(voting1);
//         coreContract.vote(arg, me, true);
//         coreContract.vote(col, me, true);
//         // coreContract.vote(br, me, true);
//         RequirementToVote[] memory result = coreContract
//             .getRequirementsToVote();
//         // RequirementToShow[] memory result = getRequirements(voting1);

//         assertEq(result.length, 1);
//     }

//     // function getRequirements(address _votingToCheck)
//     //     public
//     //     view
//     //     returns (RequirementToShow[] memory)
//     // {
//     //     RequirementToShow[] memory dataToReturn;
//     //     uint256 toReturnDataIndex = 0;
//     //     string[] memory countriesToIterate = coreContract.getCountries();
//     //     for (uint256 i = 0; i < countriesToIterate.length; i++) {
//     //         string memory country = countriesToIterate[i];
//     //         VotingPower votingPower = coreContract.countries(country);
//     //         address[] memory requirementsListAddreses = votingPower
//     //             .getAllRequirementsList();
//     //         console.log(country);
//     //         console.log(requirementsListAddreses.length);
//     //         for (
//     //             uint256 index = 0;
//     //             index < requirementsListAddreses.length;
//     //             index++
//     //         ) {
//     //             address addressToCheck = requirementsListAddreses[index];
//     //             Vote[] memory votes = votingPower.getRequirementsVotes(
//     //                 addressToCheck
//     //             );

//     //             bool alreadyVoted = false;
//     //             for (
//     //                 uint256 votesIndex = 0;
//     //                 votesIndex < votes.length;
//     //                 votesIndex++
//     //             ) {
//     //                 Vote memory voteToCheck = votes[votesIndex];
//     //                 if (voteToCheck.votedBy == _votingToCheck) {
//     //                     alreadyVoted = true;
//     //                     break;
//     //                 }
//     //             }
//     //             if (!alreadyVoted) {
//     //                 //Return Video
//     //                 SubmitRequirement memory toUse = votingPower
//     //                     .getRequirements(addressToCheck);
//     //                 RequirementToShow memory toReturn = RequirementToShow(
//     //                     toUse.videoUrl,
//     //                     addressToCheck,
//     //                     country
//     //                 );
//     //                 dataToReturn[toReturnDataIndex] = toReturn;
//     //                 toReturnDataIndex += 1;
//     //             }
//     //         }
//     //     }
//     //     return dataToReturn;
//     // }
// }
