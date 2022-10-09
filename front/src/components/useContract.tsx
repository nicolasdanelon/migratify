import { ethers, Contract } from "ethers";

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
