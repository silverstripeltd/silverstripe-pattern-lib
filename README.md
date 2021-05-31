# silverstripe-pattern-lib

This repo uses a GitHub action to build the latest version of the Silverstripe CMS pattern library once a day.

[View the Silverstripe CMS pattern library](https://silverstripe.github.io/silverstripe-pattern-lib)

## How it works

The GitHub action runs two bash scripts
- `get_composer.bash` that downloads composer ([copied from the composer site](https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md))
- `build_pattern_lib.bash` which
  - clones `silverstripe/admin`
  - installs the `silverstripe/installer`
  - install NPM dependencies
  - build the pattern library
