npm init -y
npm i -D babel-preset-es2015 babel-preset-stage-2 babel-preset-react 
npm i -D babel-eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard eslint-plugin-react prettier-eslint

curl -fsSL https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/.babelrc > .babelrc
curl -fsSL https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/.eslintrc > .eslintrc

node mergePackage.js
#configPackage=$(curl -fsSL https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/package.json)
# currentPackage=$(cat package.json)
#echo $configPackage$currentPackage | json --merge

# npm i -g json
# json --in-place -f package.json -e 'this.scripts={"start": "node index.js"}'

#$ cat /opt/app/etc/defaults.json \
#    /etc/app/config.json \
#    ~/.app/config.json | json --merge