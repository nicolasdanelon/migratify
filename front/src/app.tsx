import React, { h } from "preact";
import { MetamaskStateProvider } from "use-metamask";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { ethers } from "ethers";
import Template from "./components/Template";
import Home from "./pages/Home";
import Migration from "./pages/Migration";
import { createContext } from "preact/compat";
import Traveler from "./pages/Traveler";

export const EthContext = createContext({ ethereum: null, provider: null });

const { providers } = ethers;
const { Web3Provider } = providers;
// @ts-ignore
const { ethereum } = window;

const provider = new Web3Provider(ethereum);

const value = {
  ethereum,
  provider,
};

const TheRouter = () => (
  <Routes>
    <Route path="/" element={<Template />}>
      <Route path="/" element={<Home />} />
      <Route path="/migration" element={<Migration />} />
      <Route path="/traveler" element={<Traveler />} />
    </Route>
  </Routes>
);

export function App() {
  return (
    <MetamaskStateProvider>
      <BrowserRouter>
        {/* @ts-ignore */}
        <EthContext.Provider value={value}>
          <TheRouter />
        </EthContext.Provider>
      </BrowserRouter>
    </MetamaskStateProvider>
  );
}
