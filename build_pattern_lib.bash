# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

yarn cache clean
git clone https://github.com/silverstripe/silverstripe-admin.git
cd silverstripe-admin
export COMPOSER_ROOT_VERSION=1.x-dev
../composer.phar require silverstripe/installer:4.x-dev --prefer-source
yarn install && yarn static-pattern-lib
mv storybook-static ../
cd ..
#rm -rf silverstripe-admin
