GITHUB_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/"

REMOTE_BABEL_FILE=$GITHUB_RAW_URL".babelrc"
REMOTE_ESLINT_FILE=$GITHUB_RAW_URL".eslintrc"
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_RAW_URL"mergePackage.js"

curl -fsSL $REMOTE_BABEL_FILE > .babelrc
curl -fsSL $REMOTE_ESLINT_FILE > .eslintrc

npm i lodash request request-promise
GITHUB_RAW_URL=$GITHUB_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i