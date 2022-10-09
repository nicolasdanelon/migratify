// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts/utils/Counters.sol";

contract FakeWorldCoin is ERC721 {
    mapping(string => address) public biometricalData;
    uint256 private tokenId;

    constructor() ERC721("FakeWorldCoin", "FWCT") {
        tokenId = 1;
    }

    function safeMint(address to, string memory uri) public {}

    function secureMint(address _to, string memory _hashOfBiometricalData)
        public
    {
        require(
            biometricalData[_hashOfBiometricalData] == address(0),
            "You have already registered this biometrical Information"
        );
        biometricalData[_hashOfBiometricalData] = _to;
        _safeMint(_to, tokenId);
        tokenId += 1;
    }

    function balanceByBiometricalData(string memory _hashOfBiometricalData)
        public
        returns (uint256)
    {
        address addressData = biometricalData[_hashOfBiometricalData];
        require(
            addressData != address(0),
            "You have not registered your biometrical information"
        );
        return balanceOf(addressData);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {}

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {}

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public virtual override {}
}
