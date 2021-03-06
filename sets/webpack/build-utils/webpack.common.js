const path = require('path')
const { entryPath, outputPath } = require('./common-paths')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const ProgressBarPlugin = require('progress-bar-webpack-plugin')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const autoprefixer = require('autoprefixer')

const pathsToClean = [outputPath]

const cssLoader = { loader: 'css-loader' }
const sassLoader = {
  loader: 'sass-loader',
  options: {
    includePaths: ['src/scss']
  }
}

const postCssLoader = {
  loader: 'postcss-loader',
  options: {
    ident: 'postcss',
    plugins: [
      autoprefixer({
        browsers: ['last 3 version', 'ie >= 10']
      })
    ]
  }
}

const config = {
  entry: {
    bundle: path.resolve(entryPath, 'js/index.js')
  },
  output: {
    filename: '[name].[hash].js',
    path: outputPath
  },
  module: {
    rules: [
      /* JS */
      {
        test: /\.js$/,
        use: 'babel-loader',
        exclude: /node_modules/
      },
      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract([cssLoader, postCssLoader, sassLoader])
      },
      /* IMAGES */
      {
        test: /\.(jpe?g|png|gif)$/i,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 8000, // Convert images < 8kb to base64 strings
              name: 'images/[hash]-[name].[ext]',
              publicPath: '/app/build/'
            }
          }
        ]
      },
      /* SVG */
      {
        test: /\.svg$/,
        use: 'svg-inline-loader'
      },
      /* HTML */
      {
        test: /\.html$/,
        use: 'html-loader?root=.'
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin('css/style.css'),
    new CleanWebpackPlugin(pathsToClean),
    new ProgressBarPlugin(),
    new HtmlWebpackPlugin({
      filename: 'index.html',
      favicon: 'src/assets/favicon.ico',
      template: 'src/assets/index.template.html'
    })
  ]
}

module.exports = config
