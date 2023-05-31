# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

git clone https://github.com/silverstripe/silverstripe-admin.git
cd silverstripe-admin
git checkout 2
export COMPOSER_ROOT_VERSION=2.x-dev
composer config allow-plugins.composer/installers true
composer config allow-plugins.silverstripe/recipe-plugin true
composer config allow-plugins.silverstripe/vendor-plugin true
../composer.phar require silverstripe/asset-admin:2.x-dev --prefer-source --no-install
../composer.phar require silverstripe/session-manager:2.x-dev --prefer-source --no-install
../composer.phar require silverstripe/tagfield:3.x-dev --prefer-source --no-install
../composer.phar require dnadesign/silverstripe-elemental:5.x-dev --prefer-source
yarn cache clean
yarn install
yarn static-pattern-lib
mv storybook-static ../
cd ..
rm -rf silverstripe-admin
