import 'dart:math';

import 'package:mason/mason.dart';

List<Map<String, String>> computeFlavors(List<String> others) {
  for (final name in others) {
    assertValidFlavorName(name);
  }

  return [
    for (final name in others)
      {
        'flavor': name,
        'abbreviation': _makeAbbreviation(name),
      },
  ];
}

String _makeAbbreviation(String input) {
  final regex = RegExp('[aeiou]');
  final noVowels = input.replaceAll(regex, '');
  final maxLength = min(noVowels.length, 3);
  final abbreviation = noVowels.substring(0, maxLength);
  return '[${abbreviation.upperCase}]';
}

void assertValidFlavorName(String input) {
  if (_flavorRegex.hasMatch(input)) return;

  throw InvalidFlavorNameException(input);
}

final _flavorRegex = RegExp(r'^[A-Za-z0-9_]+$');

class InvalidFlavorNameException implements Exception {
  const InvalidFlavorNameException(this.flavor);
  final String flavor;
  @override
  String toString() => 'Invalid flavor name: $flavor';
}
