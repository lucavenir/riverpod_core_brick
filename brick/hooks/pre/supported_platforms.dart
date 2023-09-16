import 'dart:io' as io;

Iterable<AvailablePlatform> parsePlatforms(Iterable<String> platforms) {
  return platforms.map(AvailablePlatform.fromString);
}

void assertViableFlavoring(Iterable<AvailablePlatform> requested) {
  if (io.Platform.isMacOS) return;

  final applePlatforms = {AvailablePlatform.ios, AvailablePlatform.macos};
  final noAppleOs = requested.toSet().intersection(applePlatforms).isEmpty;
  if (noAppleOs) return;

  throw MissingXCodeException();
}

enum AvailablePlatform {
  android,
  ios,
  windows,
  linux,
  web,
  macos;

  const AvailablePlatform();
  factory AvailablePlatform.fromString(String os) => switch (os) {
        'android' => AvailablePlatform.android,
        'ios' => AvailablePlatform.ios,
        'macos' => AvailablePlatform.macos,
        'windows' => AvailablePlatform.windows,
        'linux' => AvailablePlatform.linux,
        'web' => AvailablePlatform.web,
        _ => throw UnsupportedPlatformException(os),
      };

  String toString() => '$name';
}

class UnsupportedPlatformException implements Exception {
  const UnsupportedPlatformException(this.os);
  final String os;
  @override
  String toString() => "This OS isn't supported by this brick yet: $os";
}

class MissingXCodeException implements Exception {
  const MissingXCodeException();
  @override
  String toString() => "Can't support flavoring on Apple OSs from this operating system.";
}
