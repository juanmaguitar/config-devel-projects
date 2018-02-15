const fs = require('fs')
const { readFile, writeFile, existsSync } = require('fs')
const _ = require('lodash');
const exec = require('child_process').exec
const path = require('path')
const rp = require('request-promise')

const PACKAGE_NAME = 'package.json'
const urlRemote = process.env.GITHUB_RAW_URL

const urlRemoteConfigPackage = urlRemote + PACKAGE_NAME

/* helpers */
const doesExist = source => existsSync(source)
const getCurrentDirShell = () => 
  new Promise( resolve => exec('pwd', (_, stdout) => resolve(stdout.replace('\n','')) ) )

const pReadFile = pathToRead =>
  new Promise( resolve => 
    readFile(pathToRead, 'utf-8', (_, content) => resolve(content))
  ) 
const pWriteFile = (pathToWrite, oToWrite) => {
  jsonToWrite = JSON.stringify(oToWrite, null, 2)
  return new Promise( resolve => writeFile(pathToWrite, jsonToWrite, resolve)) 
}

(async function() {
  
  const pathCurrentProject = await getCurrentDirShell()
  const pathCurrentPackage = path.join(pathCurrentProject, PACKAGE_NAME)
  
  const sConfigPackage = (await rp(urlRemoteConfigPackage)) || '{}'

  const sCurrentPackage = doesExist(pathCurrentPackage)
    ? (await pReadFile(pathCurrentPackage, 'utf-8')) 
    : '{}'

  const oConfigPackage = JSON.parse(sConfigPackage)
  const oCurrentPackage = sCurrentPackage ? JSON.parse(sCurrentPackage) : {}

  const oMergedPackage = _.merge(oCurrentPackage, oConfigPackage)

  await pWriteFile(pathCurrentPackage, oMergedPackage)
  
  console.log("✍️ Properties (scripts & congig) added to package.json...")

})()


