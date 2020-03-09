const path = require("path");

module.exports = {
  entry: "./lib/turfjs-entry.js",
  mode: "production",
  output: {
    path: path.resolve(__dirname, "./lib"),
    filename: "turfjs-build.js"
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        use: {
          loader: "babel-loader",
          options: {
            presets: [
              [
                "@babel/preset-env",
                {
                  targets: {
                    node: 8
                  }
                }
              ]
            ]
          }
        }
      }
    ]
  }
};
