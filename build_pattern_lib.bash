git clone https://github.com/silverstripe/silverstripe-admin.git
cd silverstripe-admin
export COMPOSER_ROOT_VERSION=1.x-dev
composer require silverstripe/installer:4.x-dev --prefer-source
yarn install && yarn static-pattern-lib
mv storybook-static ../
cd ..
rm -rf silverstripe-admin
