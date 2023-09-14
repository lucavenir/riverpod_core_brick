import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../logs/init_logging.dart';
import 'init_overrides.dart';

Future<void> init({
  required ValueGetter<Widget> builder,
  required Flavor flavor,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  initErrorReporting();
  final providerObserver = initProviderObserver();
  final overrides = await initOverridesWith(flavor);

  // add more configurations here
  runApp(ProviderScope(
    overrides: overrides,
    observers: const [providerObserver],
    child: await builder(),
  ));
}
