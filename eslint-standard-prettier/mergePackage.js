const rp = require('request-promise')
const urlConfigPackage = 'https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json'
async (() => {
  const configPackage await rp(urlConfigPackage)
  console.log(configPackage)
})()