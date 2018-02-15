const fs = require('fs')
const path = require('path')
const rp = require('request-promise')

const urlConfigPackage = 'https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json'

rp(urlConfigPackage)
  .then(configPackage => {

    const currentPackage = require(path.join(__dirname,'package.json'))

    const mergedPackage = Object.assign({}, JSON.parse(configPackage), currentPackage)
    console.log(mergedPackage)

    fs.writeFileSync('package.json', JSON.stringify(mergedPackage, null, 2))
    console.log("✍️ Scripts added to package.json...")

  })


