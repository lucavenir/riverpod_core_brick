Iterable<AvailablePlatform> parsePlatforms(Iterable<String> platforms) {
  return platforms.map(AvailablePlatform.fromString);
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

  @override
  String toString() => name;
}

class UnsupportedPlatformException implements Exception {
  const UnsupportedPlatformException(this.os);
  final String os;
  @override
  String toString() => "This OS isn't supported by this brick yet: $os";
}
