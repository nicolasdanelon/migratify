import { useMetamask } from "use-metamask";
import { ethers } from "ethers";
import { useEffect, useState } from "preact/compat";

// @ts-ignore
const { ethereum } = window;

const cssClass =
  "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 " +
  "focus:outline-none focus:ring-blue-300 font-medium rounded-lg " +
  "text-sm px-5 py-2.5 text-center mr-3 md:mr-0 dark:bg-blue-600 " +
  "dark:hover:bg-blue-700 dark:focus:ring-blue-800";

const LoginButton = () => {
  const { connect, metaState } = useMetamask();
  const [axx, setAxx] = useState("");

  useEffect(() => {
    if (!metaState.isConnected) {
      (async () => {
        try {
          await connect(ethers.providers.Web3Provider, "any");
        } catch (error) {
          console.log(error);
        }
      })();
    } else {
      setAxx(metaState.account[0]);
    }
  }, []);

  useEffect(() => {
    if (metaState.isAvailable && !metaState.isConnected) {
      (async () => {
        try {
          await connect(ethers.providers.Web3Provider, "any");
        } catch (error) {
          // console.log(error);
        }
      })();
    }
  }, [metaState.isAvailable]);

  const connectWallet = async () => {
    const data = await ethereum.request({
      method: "eth_requestAccounts",
    });

    setAxx(data[0]);
  };

  if (!metaState.isAvailable) {
    return (
      <button
        className={cssClass}
        onClick={() => window.open("https://metamask.io/", "_blank")}
      >
        Get MataMask
      </button>
    );
  }

  if (metaState.isConnected) {
    return (
      <button className={cssClass} title={axx}>
        {metaState.account[0].slice(0, 5)}...
        {metaState.account[0].slice(38, 42)}
      </button>
    );
  } else {
    return (
      <button className={cssClass} onClick={connectWallet}>
        Connect wallet
      </button>
    );
  }
};

export default LoginButton;
