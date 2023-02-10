npm init --yes
npm install react react-dom
npm install -D webpack webpack-cli babel-loader @babel/core @babel/plugin-transform-react-jsx
mkdir dist src
touch dist/index.html dist/styles.css src/index.jsx src/app-name.jsx
npm set-script build webpack
npm set-script watch "webpack --watch --mode=development --stats=minimal --devtool=source-map"

printf "module.exports = {
  resolve: {
    extensions: ['.js', '.jsx']
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            plugins: [
              '@babel/plugin-transform-react-jsx'
            ]
          }
        }
      }
    ]
  },
  performance: {
    hints: false
  }
};
" > webpack.config.js

printf "<!DOCTYPE html>
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <title>Document</title>
  <link rel=\"stylesheet\" href=\"styles.css\">
</head>
<body>
  <div id=\"root\"></div>
  <script src=\"main.js\"></script>
</body>
</html>
" > dist/index.html

printf "
import React from 'react';
import ReactDOM from 'react-dom/client';
import AppName from './app-name';
const element = <AppName />;
const root = ReactDOM.createRoot(document.querySelector('#root'));
root.render(element);
" > src/index.jsx

printf "
import React from 'react';
export default class AppName extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
    this.handleClick=this.handleClick.bind(this);
  }

    handleClick() {
    this.setState();
  }
  render() {
    return (
      <div></div>
    );
  }
}
" > src/app-name.jsx
