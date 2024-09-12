import 'package:mason/mason.dart';

void assertValidDartPackageName(String input) {
  if (input.snakeCase == input) return;

  throw InvalidPackageNameException(input);
}

class InvalidPackageNameException implements Exception {
  const InvalidPackageNameException(this.pkgName);
  final String pkgName;

  @override
  String toString() => 'Invalid package name: $pkgName';
}
