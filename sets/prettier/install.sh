GITHUB_SET_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/sets/prettier/"
GITHUB_HELPERS_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/helpers/"

REMOTE_MERGE_PACKAGES_NODE=$GITHUB_HELPERS_RAW_URL"mergePackage.js"

echo "Merging properties in package.json ..."
npm i lodash request request-promise
GITHUB_RAW_URL=$GITHUB_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i