GITHUB_SET_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/sets/eslint-standard-prettier/"
GITHUB_HELPERS_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/helpers/"

REMOTE_BABEL_FILE=$GITHUB_RAW_URL".babelrc"
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_HELPERS_RAW_URL"mergePackage.js"

echo "Creating .babelrc"
curl -fsSL $REMOTE_BABEL_FILE > .babelrc

echo "Merging properties in package.json ..."
npm i lodash request request-promise
GITHUB_RAW_URL=$GITHUB_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i