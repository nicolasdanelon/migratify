import React from "preact/compat";

export default function VideoInput(props: { width: any; height: any; }) {
  const { width, height } = props;

  const inputRef = React.useRef();

  const [source, setSource] = React.useState();

  const handleFileChange = (event: { target: { files: any[]; }; }) => {
    const file = event.target.files[0];
    const url = URL.createObjectURL(file);
    // @ts-ignore
    setSource(url);
  };

  // @ts-ignore
  const handleChoose = (event) => {
    event.preventDefault();
    // @ts-ignore
    inputRef.current.click();
  };

  return (
    <div className="VideoInput">
      {/* @ts-ignore */}
      <input
        ref={inputRef}
        className="VideoInput_input"
        type="file"
        onChange={handleFileChange}
        accept=".mov,.mp4"
      />
      {!source && <button onClick={handleChoose}>Choose</button>}
      {source && (
        <video
          className="VideoInput_video"
          width="100%"
          height={height}
          controls
          src={source}
        />
      )}
      <div className="VideoInput_footer">{source || "Nothing selectd"}</div>
    </div>
  );
}
