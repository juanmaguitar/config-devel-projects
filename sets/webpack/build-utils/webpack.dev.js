const config = {
  devtool: 'source-map', // webpack.org/configuration/devtool
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'eslint-loader',
        options: {
          // emitWarning: true,
          // fix: false,
          // quiet: false,
          // failOnError: false,
          // failOnWarning: false
        }
      }
    ]
  }
}

module.exports = config
