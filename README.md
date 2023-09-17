# VIPER template for Xcode (15.0.0)

[Russian :ru:](./README_RU.md)

:star2: If you liked our project, please **give us a star**! This will help other developers learn about our work and appreciate it. Thank you!

This template is designed for those who want to quickly start developing a project in Xcode using the VIPER architecture.
Eliminate the routine of setting up a project with this ready-made template.

### Features

- Automatic project setup upon its creation.
- Save time with pre-installed configurations.
- Generation of the following files and components when creating a project:
    - Gemfile
    - fastlane
    - Rambafile
    - Base classes
    - Extensions
    - Helpers


### Installation
To install the template, run the following command. The template will be installed in the `~/Library/Developer/Xcode/Templates` directory.

```shell
curl -sSL https://raw.githubusercontent.com/emvakar/xcode-template-viper/main/install_template.sh | bash
```

### Usage

1. Create a new project through Xcode GUI.
2. Select the `iOS` category.
3. Scroll down to the `Others` section and choose the `AppVIPER` template.

### Dependencies

We use the Swift Package Manager for dependency management.
Our template requires the following base dependencies:

- SnapKit `https://github.com/SnapKit/SnapKit.git`

### Generabma

Generamba is our code generation tool.

To install the latest templates:

```shell
generamba  template  install
```

To create a new module for development:

```shell
generamba  gen  MODULE_NAME  ios_viper
```