const fs = require('fs')
const rp = require('request-promise')

const urlConfigPackage = 'https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json'

(async () => {

  console.log(__dirname)
  console.log(process.cwd)

  const configPackage = await rp(urlConfigPackage)
  const currentPackage = require('package.json')

  const mergedPackage = Object.assign({}, JSON.parse(configPackage), currentPackage)
  console.log(mergedPackage)

  await fs.writeFile('package.json', JSON.stringify(mergedPackage, null, 2))
  console.log("✍️ Scripts added to package.json...")

})()
