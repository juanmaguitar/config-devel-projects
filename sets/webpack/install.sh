GITHUB_RAW_BASE="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master"
GITHUB_SET_RAW_URL=$GITHUB_RAW_BASE"/sets/webpack/"

# Files creation
echo "Creating build-utils folder & files ..."
mkdir build-utils
mkdir build-utils/addons

REMOTE_WEBPACK=$GITHUB_SET_RAW_URL"webpack.config.js"
curl -fsSL $REMOTE_WEBPACK > webpack.config.js

REMOTE_COMMON_PATHS=$GITHUB_SET_RAW_URL"build-utils/common-paths.js"
curl -fsSL $REMOTE_COMMON_PATHS > build-utils/common-paths.js

REMOTE_WEBPACK_COMMON=$GITHUB_SET_RAW_URL"build-utils/webpack.common.js"
curl -fsSL $REMOTE_WEBPACK_COMMON > build-utils/webpack.common.js

REMOTE_WEBPACK_DEV=$GITHUB_SET_RAW_URL"build-utils/webpack.dev.js"
curl -fsSL $REMOTE_WEBPACK_DEV > build-utils/webpack.dev.js

REMOTE_WEBPACK_PROD=$GITHUB_SET_RAW_URL"build-utils/webpack.prod.js"
curl -fsSL $REMOTE_WEBPACK_PROD > build-utils/webpack.prod.js

REMOTE_WEBPACK_ADDON_BUNDLEANALYZE=$GITHUB_SET_RAW_URL"build-utils/addons/webpack.bundleanalyze.js"
curl -fsSL $REMOTE_WEBPACK_ADDON_BUNDLEANALYZE > build-utils/addons/webpack.bundleanalyze.js

REMOTE_WEBPACK_ADDON_BUNDLEBUDDY=$GITHUB_SET_RAW_URL"build-utils/addons/webpack.bundlebuddy.js"
curl -fsSL $REMOTE_WEBPACK_ADDON_BUNDLEBUDDY > build-utils/addons/webpack.bundlebuddy.js

# Merge package.json
echo "Merging properties in package.json ..."
REMOTE_MERGE_PACKAGES_NODE=$GITHUB_RAW_BASE"/helpers/mergePackages.js"
npm i lodash request request-promise
GITHUB_SET_RAW_URL=$GITHUB_SET_RAW_URL node -e "$(curl -fsSL $REMOTE_MERGE_PACKAGES_NODE)"
cat package.json
npm i