GITHUB_RAW_BASE="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master"
GITHUB_SET_RAW_URL=$GITHUB_RAW_BASE"/sets/prettier/"

# Merge package.json
echo "Merging properties in package.json ..."
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_RAW_BASE"/helpers/mergePackages.js"
yarn add lodash request request-promise
GITHUB_SET_RAW_URL=$GITHUB_SET_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
yarn install