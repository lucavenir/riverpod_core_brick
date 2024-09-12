
import 'package:flutter/services.dart';

enum {{name.pascalCase()}}Flavor {
  development,
  staging,
  production;

  const {{name.pascalCase()}}Flavor();

  factory {{name.pascalCase()}}Flavor.fromEnv() => switch (appFlavor) {
        'development' => development,
        'staging' => staging,
        'production' => production,
        _ => throw MissingOrWrongFlavorError(appFlavor),
      };
}

class MissingOrWrongFlavorError extends Error {
  MissingOrWrongFlavorError(this.flavor);
  final String? flavor;
  @override
  String toString() {
    return flavor == null
      ? 'Missing --flavor options. Please run `flutter run/build` with `--flavor`'
      : 'Wrong or unexpected flavor: $flavor';
  }
}

