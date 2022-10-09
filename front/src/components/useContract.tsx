import { ethers, Contract } from "ethers";

export const core_contract = [
  "function submitRequirement((string, string[])) public",
  "function vote(string memory _country, address _addressToVote, bool _vote) public",
  "function addNewCountry(string memory _country) public",
  "function checkAllowed(string memory _country, string memory _biometricalData) public returns (bool)",
];

export const voting_power = [
  "function submitRequirement(address _fromRequirement,SubmitRequirement memory _submitRequirement) public",
  "function vote(address _voteFrom,address _addressToVote,bool _vote) external",
  "function allowed(string memory _biometricalData) public returns (bool)",
];

export const fake_world_coin = [
  "function safeMint(address to, string memory uri) public",
  "function secureMint(address _to, string memory _hashOfBiometricalData) public",
  "function balanceByBiometricalData(string memory _hashOfBiometricalData) public returns (uint256)",
  "function transferFrom(address from, address to, uint256 tokenId) public virtual override",
  "function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override",
  "function safeTransferFrom(address from,address to,uint256 tokenId,bytes memory data) public virtual override",
];

export const core_contract_address =
  "0xeb84D61B47E6B2755eee14CB29356016610B1900";
export const fake_world_coin_address =
  "0xF4a9d2D60A0Bcf268FA1d8C4ca6F6dD261e946fD";
export const voting_power_address =
  "0x0000000000000000000000000000000000000000";

const useContract: (
  contractAddress: string,
  abi: string[]
  // @ts-ignore
) => { provider: Web3Provider; contract: Contract } = (
  contractAddress,
  abi
) => {
  // @ts-ignore
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  const contract = new ethers.Contract(contractAddress, abi, signer);

  return { contract, provider };
};

export default useContract;
