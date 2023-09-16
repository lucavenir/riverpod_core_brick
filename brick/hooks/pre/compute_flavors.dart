import 'package:mason/mason.dart';

import 'validate_flavor.dart';

List<Map<String, String>> computeFlavors(List<String> others) {
  for (final name in others) {
    assertValidFlavorName(name);
  }

  return [
    for (final name in others)
      {
        'flavor': name,
        'abbreviation': name.substring(0, 3).upperCase,
      }
  ];
}
