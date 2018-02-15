const fs = require('fs')
const _ = require('lodash');
const path = require('path')
const rp = require('request-promise')

const urlConfigPackage = 'https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json'
const pathCurrentPackage =  path.join(__dirname,'package.json')

console.log(urlConfigPackage)
console.log(pathCurrentPackage)

(async function () {

  const configPackage = async rp(urlConfigPackage)
  
  const currentPackage = fs.readFileSync(pathCurrentPackage, 'utf-8')
  const mergedPackage = _.merge(JSON.parse(currentPackage), JSON.parse(configPackage))

  async fs.writeFile(pathCurrentPackage, JSON.stringify(mergedPackage, null, 2))
  console.log("✍️ Properties (scripts & congig) added to package.json...")

})


