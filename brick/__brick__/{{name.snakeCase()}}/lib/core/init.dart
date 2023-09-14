import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}

import '../logs/init_logging.dart';
import 'init_overrides.dart';
import '{{name.snakeCase()}}_flavors.dart';

Future<void> init({
  required ValueGetter<Widget> builder,
  required {{name.pascalCase()}}Flavor flavor,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  initErrorReporting();
  final providerObserver = initProviderObserver();
  final overrides = await initOverridesWith(flavor: flavor);

  // add more configurations here
  runApp(ProviderScope(
    overrides: overrides,
    observers: [providerObserver],
    child: await builder(),
  ));
}
