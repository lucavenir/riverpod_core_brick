# Riverpod Core Brick
A Riverpod + Clean Architecture base project

This is an opinionated brick, based on [this architecture](https://github.com/lucavenir/riverpod_architecture_example).
This brick allows us to:
- Pick and choose the platforms we're developing on to
- Set-up a base Flutter project **with up-to-date dependencies**
- Customize the usage of Riverpod's ecosystem: codegen? hooks? freezed? We've got you covered
- Use some de-default analysis customizations, thorugh an opinionated `analysis_options.dart` and with `very_good_analysis` (by default)
- Write a base flavoring set-up using `flutter_flavorizr` (without actually run this tool)

## Important notes about this brick
Before anything, take a look @ [its definition](brick/brick.yaml).

### Pre and post gen
Writing templates works great on `lib` and `test` folders, but it quickly gets old for other customizations, such as dependencies or native-related details.

Since we want the latest dependencies to be installed, while having a working native environment, this project heavily relies on pre and post generation hooks.

### About custom analysis
This project uses `very_good_analysis` by default, but you'll be prompted to confirm this.
Furhtermore, you'll notice that `analysis_options.dart` has many opinionated customizations to match our needs; you can easily change these with almost zero effort by hand.

### About flavoring
This project sets up a `flavorizr.yaml` file, so that you can run `flutter_flavorizr` on your own *after* this brick is done creating your project.

This brick *doesn't* run this tool on its own. You'll have to do it by hand afterwards, with `flutter pub run flutter_flavorizr --processors <...>`. See its [documentation](https://pub.dev/packages/flutter_flavorizr) on how to customize its run.

This allows you to choose which processors to run, e.g. you can add your custom app icon before flavoring.

Setting up native flavors isn't as easy as it looks; as specified above, setting up a custom flavoring template wouldn't be maintainable (and it would be actually less customizable!). `flutter_flavorizr` is the best tool to address these problems.

## Getting started
New to Mason? Read [the documentation](https://docs.brickhub.dev/installing) to learn how to spin up this brick!

## Contributing
This project might need your help. Please raise issues about bugs or unexpected behaviors and submit PRs if you will.
