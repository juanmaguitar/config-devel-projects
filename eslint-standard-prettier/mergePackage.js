const fs = require('fs')
const _ = require('lodash');
const path = require('path')
const rp = require('request-promise')

const PACKAGE_NAME = 'package.json'
const urlRemote = 'https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/'

const urlRemoteConfigPackage =  path.join(urlRemote, PACKAGE_NAME)
const pathCurrentPackage =  path.join(__dirname,PACKAGE_NAME)

(async function () {
  const configPackage = await rp(urlRemoteConfigPackage)
  const currentPackage = await fs.readFile(pathCurrentPackage, 'utf-8')

  const mergedPackage = _.merge(JSON.parse(currentPackage), JSON.parse(configPackage))

  await fs.writeFile(pathCurrentPackage, JSON.stringify(mergedPackage, null, 2))
  
  console.log("✍️ Properties (scripts & congig) added to package.json...")
})


