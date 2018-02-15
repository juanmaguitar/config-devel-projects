const fs = require('fs')
const rp = require('request-promise')

const urlConfigPackage = 'https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json'
const currentPackage = require('package.json')

const mergedPackage = Object.assign({}, JSON.parse(urlConfigPackage), currentPackage)
console.log(mergedPackage)
fs.writeFileSync('package.json', JSON.stringify(mergedPackage, null, 2))

console.log("✍️ Scripts added to package.json...")
