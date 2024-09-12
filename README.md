# Riverpod Core Brick
A Riverpod + Clean Architecture base project

This is an opinionated brick, based on [this architecture](https://github.com/lucavenir/riverpod_architecture_example).
This brick allows us to:
- Pick and choose the platforms we're developing on to
- Set-up a base Flutter project **with up-to-date dependencies**
- Customize the usage of Riverpod's ecosystem: codegen? hooks? freezed? We've got you covered
- Use some de-default analysis customizations, thorugh an opinionated `analysis_options.dart` and with `very_good_analysis` (by default)
- Write a base flavoring set-up using `flutter_flavorizr` (without actually run this tool)

## Getting started
New to Mason? Read [the documentation](https://docs.brickhub.dev/installing) to learn how to spin up this brick!

## Important Note
There's a dedicated brick that adds features to this architecture *seamlessly*; for each feature, you can pick and choose which layer you'd like to use. It automatically detects your configurations from this project - or not, as you'd like.

Check out [riverpod_clean_feature](https://github.com/lucavenir/riverpod_clean_feature_brick), now available on brickhub.

## Brick implementation details
Before anything, take a look @ [its definition](brick/brick.yaml).

### Pre and post gen
Instead of writing a `lib` template, this brick heavily relies on pre and post code gen, mostly to update dependencies and run `build_runner`.

Templates are still a great option to write `lib` and `test` folders tho.

### About custom analysis
This brick prompts you if you'd love to use `very_good_analysis` (`Y` by default).
You can then notice that `analysis_options.dart` has many opinionated customizations; you can easily change that (aka delete my own rules) with almost zero effort.

### About flavoring
This brick prompts you if you'd love to use `flutter_flavorizr` (`Y` by default) to set-up native flavors, **without actually running it**. The brick simply sets up a `flavorizr.yaml` with the prompted configuration, so that you can run `flutter_flavorizr` on your own later on.

This is desirable, cause chances are you'll add icons and more configuration *after* this brick is done creating your project (yes, even after the post-gen).

See [flavorizr' documentation](https://pub.dev/packages/flutter_flavorizr) on how to customize its run.

## Contributing
This project might need your help. Please raise issues about bugs or unexpected behaviors and submit PRs if you will.
