npm init -y
npm i -D babel-preset-es2015 babel-preset-stage-2 babel-preset-react 
npm i -D babel-eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard eslint-plugin-react prettier-eslint

GITHUB_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/"

curl -fsSL $GITHUB_RAW_URL+".babelrc" > .babelrc
curl -fsSL $GITHUB_RAW_URL+".eslintrc" > .eslintrc

npm i lodash request request-promise
curl -fsSL $GITHUB_RAW_URL+"mergePackage.js" | node