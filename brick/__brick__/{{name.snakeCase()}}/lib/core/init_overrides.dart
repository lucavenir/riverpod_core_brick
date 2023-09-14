{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
import 'package:package_info_plus/package_info_plus.dart';

import '../clients/package_info.dart';
import '{{name.snakeCase()}}_flavors.dart';

Future<List<Override>> initOverridesWith({required {{name.pascalCase()}}Flavor flavor}) async {
  final packageInfo = await PackageInfo.fromPlatform();

  return [
    flavorProvider.overrideWith((ref) {
      ref.keepAlive();
      return flavor;
    }),
    packageInfoProvider.overrideWith((ref) {
      ref.keepAlive();
      return packageInfo;
    }),
    // add more overrides
  ];
}
