const ExtractTextWebpackPlugin = require('extract-text-webpack-plugin')
const UglifyWebpackPlugin = require('uglifyjs-webpack-plugin')
const CompressionWebpackPlugin = require('compression-webpack-plugin')

const config = {
  devtool: 'source-map', // webpack.org/configuration/devtool
  plugins: [
    new UglifyWebpackPlugin({
      sourceMap: true
    }),
    new CompressionWebpackPlugin({
      asset: '[path].gz[query]',
      algorithm: 'gzip',
      test: /\.(js|html|css)$/,
      threshold: 10240,
      minRatio: 0.8
    })
  ]
}

module.exports = config
