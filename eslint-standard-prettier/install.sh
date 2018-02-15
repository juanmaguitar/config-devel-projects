npm init -y
npm i -D babel-preset-es2015 babel-preset-stage-2 babel-preset-react 
npm i -D babel-eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard eslint-plugin-react prettier-eslint

curl -fsSL https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/.babelrc > .babelrc
curl -fsSL https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/.eslintrc > .eslintrc

npm i package-merge request request-promise
curl -fsSL https://rawgit.com/juanmaguitar/config-devel-projects/master/eslint-standard-prettier/mergePackage.js | node