GITHUB_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/"

curl -fsSL $GITHUB_RAW_URL".babelrc" > .babelrc
curl -fsSL $GITHUB_RAW_URL".eslintrc" > .eslintrc

npm i lodash request request-promise
curl -fsSL $GITHUB_RAW_URL"mergePackage.js" | node