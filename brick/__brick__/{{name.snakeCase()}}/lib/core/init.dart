import 'package:flutter/widgets.dart';
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}

import '../logs/init_talker.dart';
import '{{name.snakeCase()}}_flavors.dart';
import '{{name.snakeCase()}}.dart';
import '../logs/{{name.snakeCase()}}_provider_observer.dart';

Future<void> initWith({{name.pascalCase()}}Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = initTalker();

  // add more configurations here
  runApp(ProviderScope(
    overrides: [
      flavorProvider.overrideWith((ref) {
        ref.keepAlive();
        return flavor;
      }),
      talkerProvider.overrideWith((ref) {
        ref.keepAlive();
        return talker;
      }),
    ],
    observers: [{{name.pascalCase()}}ProviderObserver(talker)],
    child: {{name.PascalCase()}},
  ));
}
