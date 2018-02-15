const fs = require('fs')
const _ = require('lodash');
const path = require('path')
const rp = require('request-promise')

const PACKAGE_NAME = 'package.json'
const urlRemote = 'https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/'

const urlRemoteConfigPackage = urlRemote + PACKAGE_NAME
const pathCurrentPackage = path.resolve(__dirname, PACKAGE_NAME)

(async () => {
  const sConfigPackage = (await rp(urlRemoteConfigPackage)) || '{}'
  const sCurrentPackage = (await fs.readFile(pathCurrentPackage, 'utf-8')) || '{}'

  const oConfigPackage = JSON.parse(configPackage)
  const oCurrentPackage = JSON.parse(currentPackage)

  const oMergedPackage = _.merge(oCurrentPackage, oConfigPackage)

  await fs.writeFile(pathCurrentPackage, JSON.stringify(oMergedPackage, null, 2))
  
  console.log("✍️ Properties (scripts & congig) added to package.json...")
})()


