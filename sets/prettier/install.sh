GITHUB_RAW_BASE="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master"
GITHUB_SET_RAW_URL=$GITHUB_RAW_BASE"/sets/prettier/"

# Merge package.json
echo "Merging properties in package.json ..."
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_RAW_BASE"/helpers/mergePackages.js"
npm i lodash request request-promise
GITHUB_SET_RAW_URL=$GITHUB_SET_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i