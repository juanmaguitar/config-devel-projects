GITHUB_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/sets/webpack/"
GITHUB_HELPERS_RAW_URL="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master/helpers/"

REMOTE_WEBPACK=$GITHUB_RAW_URL"webpack.config.js"

REMOTE_COMMON_PATHS=$GITHUB_RAW_URL"build-utils/common-paths.js"
REMOTE_WEBPACK_COMMON=$GITHUB_RAW_URL"build-utils/webpack.common.js"
REMOTE_WEBPACK_DEV=$GITHUB_RAW_URL"build-utils/webpack.dev.js"
REMOTE_WEBPACK_PROD=$GITHUB_RAW_URL"build-utils/webpack.prod.js"

REMOTE_WEBPACK_ADDON_BUNDLEANALYZE=$GITHUB_RAW_URL"addons/webpack.bundleanalyze.js"
REMOTE_WEBPACK_ADDON_BUNDLEBUDDY=$GITHUB_RAW_URL"addons/webpack.bundlebuddy.js"

echo "Creating build-utils folder & files ..."
mkdir build-utils
mkdir build-utils/addons
curl -fsSL $REMOTE_WEBPACK > webpack.config.js
curl -fsSL $REMOTE_COMMON_PATHS > build-utils/common-paths.js
curl -fsSL $REMOTE_WEBPACK_COMMON > build-utils/webpack.common.js
curl -fsSL $REMOTE_WEBPACK_DEV > build-utils/webpack.dev.js
curl -fsSL $REMOTE_WEBPACK_PROD > build-utils/webpack.prod.js

REMOTE_MERGE_PACKAGES_NODE=$GITHUB_HELPERS_RAW_URL"mergePackage.js"

echo "Merging properties in package.json ..."
npm i lodash request request-promise
GITHUB_RAW_URL=$GITHUB_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i