import { render } from "preact";
import { App } from "./app";
import "./index.css";
// @ts-ignore
import regeneratorRuntime from "regenerator-runtime";
const rr = regeneratorRuntime;
console.log(rr);

render(<App />, document.getElementById("app") as HTMLElement);
