import { h } from "preact";
// import { Bee, BeeDebug } from "@ethersphere/bee-js";

function Home() {
  const upload = async () => {};
  // const upload = async () => {
  //   const bee = new Bee("http://127.0.0.1:1633");
  //   const beeDebug = new BeeDebug("http://127.0.0.1:1635");
  //
  //   const postageBatchId = await beeDebug.createPostageBatch("100", 17);
  //   const result = await bee.uploadData(postageBatchId, "Bee is awesome!");
  //
  //   // prints Swarm hash of the file with which it can be retrieved here it is
  //   // fd79d5e0ebd8407e422f53ce1d7c4c41ebf403be55143900f8d1490560294780
  //   console.log(result.reference);
  //
  //   const retrievedData = await bee.downloadData(result.reference);
  //
  //   console.log(retrievedData.text()); // prints 'Bee is awesome!'
  // };

  return <button onClick={async () => await upload()}>push!</button>;
}

export default Home;
