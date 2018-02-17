const commonConfig = require('./build-utils/webpack.common')
const webpackMerge = require('webpack-merge')

const addons = addonsArg => { // eslint-disable-line no-unused-vars
  let addons = [].concat.apply([], [addonsArg]).filter(Boolean) // eslint-disable-line no-useless-call

  return addons.map(addonName =>
    require(`./build-utils/addons/webpack.${addonName}.js`)
  )
}

module.exports = (env = {}) => {
  const environment = env.env || 'dev'

  const envConfig = require(`./build-utils/webpack.${environment}.js`)
  const mergedConfig = webpackMerge(
    commonConfig,
    envConfig,
    ...addons(env.addons)
  )

  return mergedConfig
}
