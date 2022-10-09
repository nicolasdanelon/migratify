import useContract, {
  core_contract,
  core_contract_address,
} from "../components/useContract";

const Traveler = () => {
  const link =
    "https://gateway.ethswarm.org/access/677a4b93d43b04be27b395c5c3b8423b42759b738974be5a0e49e734b13408f4";
  const parameters = [link, ["arg", "col", "br"]];

  const call = async () => {
    try {
      console.log(parameters);

      const contract = useContract(core_contract_address, core_contract);
      const submitRequirement = await contract.contract.submitRequirement(
        parameters
      );

      submitRequirement.wait();

      if (submitRequirement.hash) {
        alert(submitRequirement.hash);
      }
    } catch (e) {
      console.error(e);
    }
  };

  return <button onClick={async () => await call()}>call call call</button>;
};

export default Traveler;
