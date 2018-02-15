GITHUB_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/"

curl -fsSL $GITHUB_RAW_URL".babelrc" > .babelrc
curl -fsSL $GITHUB_RAW_URL".eslintrc" > .eslintrc

npm i lodash request request-promise
GITHUB_RAW_URL=$GITHUB_RAW_URL node -e '$(curl -fsSL $GITHUB_RAW_URL"mergePackage.js")'
cat package.json
npm i