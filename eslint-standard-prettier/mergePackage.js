const fs = require('fs')
const rp = require('request-promise')
const merge = require('package-merge')

const urlConfigPackage = 'https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json'
const currentPackage = fs.readFileSync('package.json')

const mergedPackage = merge(urlConfigPackage,currentPackage)
fs.writeFileSync('package.json', JSON.stringify(mergedPackage, null, 2))

console.log("✍️ Scripts added to package.json...")
