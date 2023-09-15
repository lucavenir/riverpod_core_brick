import 'dart:io' as io;

Iterable<SupportedPlatform> parsePlatforms(Iterable<String> platforms) {
  return platforms.map(SupportedPlatform.fromString);
}

void assertViableFlavoring(Iterable<SupportedPlatform> requested) {
  if (io.Platform.isMacOS) return;

  final applePlatforms = {SupportedPlatform.ios, SupportedPlatform.macos};
  final noAppleOs = requested.toSet().intersection(applePlatforms).isEmpty;
  if (noAppleOs) return;

  throw CantBuildAppleProductsException();
}

enum SupportedPlatform {
  android,
  ios,
  macos;

  const SupportedPlatform();
  factory SupportedPlatform.fromString(String os) => switch (os) {
        'android' => SupportedPlatform.android,
        'ios' => SupportedPlatform.ios,
        'macos' => SupportedPlatform.macos,
        _ => throw UnsupportedPlatformException(os),
      };
}

class UnsupportedPlatformException implements Exception {
  const UnsupportedPlatformException(this.os);
  final String os;
  @override
  String toString() => "This OS isn't supported by this brick yet: $os";
}

class CantBuildAppleProductsException implements Exception {
  const CantBuildAppleProductsException();
  @override
  String toString() => "Can't support Apple products from this operating system. Check README.md";
}
