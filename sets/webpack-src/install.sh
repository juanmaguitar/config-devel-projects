GITHUB_RAW_BASE="https://raw.githubusercontent.com/juanmaguitar/config-devel-projects/master"
GITHUB_SET_RAW_URL=$GITHUB_RAW_BASE"/sets/webpack-src/"

# Files creation
echo "Creating build-utils folder & files ..."
mkdir src
mkdir src/{assets,js,scss}

REMOTE_FAVICON=$GITHUB_SET_RAW_URL"src/assets/favicon.ico"
curl -fsSL $REMOTE_FAVICON > assets/favicon.ico

REMOTE_INDEX_TEMPLATE=$GITHUB_SET_RAW_URL"src/assets/index.template.html"
curl -fsSL $REMOTE_INDEX_TEMPLATE > assets/index.template.html

REMOTE_INDEX_JS=$GITHUB_SET_RAW_URL"src/js/index.js"
curl -fsSL $REMOTE_INDEX_JS > js/index.js

REMOTE_INDEX_SASS=$GITHUB_SET_RAW_URL"src/scss/index.scss"
curl -fsSL $REMOTE_INDEX_SASS > scss/index.scss

