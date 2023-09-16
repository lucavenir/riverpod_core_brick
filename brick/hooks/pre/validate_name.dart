import 'package:mason/mason.dart';

void assertValidDartPackageName(String input) {
  final snakeCase = input.snakeCase;
  if (snakeCase == input) return;

  throw InvalidPackageNameException(input);
}

class InvalidPackageNameException implements Exception {
  const InvalidPackageNameException(this.pkgName);
  final String pkgName;
  @override
  String toString() => 'Invalid package name: $pkgName';
}
