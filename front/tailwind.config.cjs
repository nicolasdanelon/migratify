module.exports = {
  content: [
    './src/**/*.{js,ts,jsx,tsx}',
    'node_modules/daisyui/dist/**/*.js',
    'node_modules/react-daisyui/dist/**/*.js',
    // 'node_modules/flowbite-react/**/*.{js,jsx,ts,tsx}'
  ],
  plugins: [
    require('daisyui')
    // require('flowbite/plugin')
  ],
};
