fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### match_dev

```sh
[bundle exec] fastlane match_dev
```



### match_prod

```sh
[bundle exec] fastlane match_prod
```



### version

```sh
[bundle exec] fastlane version
```

Set new marketing version

### beta

```sh
[bundle exec] fastlane beta
```

Build and upload to testflight

### upload_ipa

```sh
[bundle exec] fastlane upload_ipa
```

Upload ipa to AppStore Connect

### upload_dsyms

```sh
[bundle exec] fastlane upload_dsyms
```

Upload symbols

### tests

```sh
[bundle exec] fastlane tests
```

Build and run unit tests

### clear_keychain

```sh
[bundle exec] fastlane clear_keychain
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
