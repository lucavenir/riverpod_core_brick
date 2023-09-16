void assertValidFlavorName(String input) {
  if (_flavorRegex.hasMatch(input)) return;

  throw InvalidFlavorNameException(input);
}

final _flavorRegex = RegExp(r'^[A-Za-z0-9_]+$');

class InvalidFlavorNameException implements Exception {
  const InvalidFlavorNameException(this.flavor);
  final String flavor;
  @override
  String toString() => "Invalid flavor name: $flavor";
}
