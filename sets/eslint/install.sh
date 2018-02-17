GITHUB_RAW_BASE="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master"
GITHUB_SET_RAW_URL=$GITHUB_RAW_BASE"/sets/eslint/"

# Files creation
REMOTE_ESLINT_FILE=$GITHUB_SET_RAW_URL".eslintrc"

echo "Creating .eslintrc ..."
curl -fsSL $REMOTE_ESLINT_FILE > .eslintrc

# Merge package.json
echo "Merging properties in package.json ..."
GITHUB_HELPERS_RAW_URL=$GITHUB_RAW_BASE"/helpers/"
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_HELPERS_RAW_URL"mergePackage.js"
npm i lodash request request-promise
GITHUB_SET_RAW_URL=$GITHUB_SET_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i