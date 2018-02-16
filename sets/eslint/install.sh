GITHUB_SET_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/sets/eslint/"
GITHUB_HELPERS_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/helpers/"

REMOTE_ESLINT_FILE=$GITHUB_SET_RAW_URL".eslintrc"
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_HELPERS_RAW_URL"mergePackage.js"

echo "Creating .eslintrc ..."
curl -fsSL $REMOTE_ESLINT_FILE > .eslintrc

echo "Merging properties in package.json ..."
npm i lodash request request-promise
GITHUB_RAW_URL=$GITHUB_SET_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i