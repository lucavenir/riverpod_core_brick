import 'core/{{name.snakeCase()}}.dart';
{{#flavorizr}}
import 'core/{{name.snakeCase()}}_flavors.dart';
{{/flavorizr}}


import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter/widgets.dart';
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}

import 'logs/talker.dart';
{{#flavorizr}}
import '{{name.snakeCase()}}_flavors.dart';
{{/flavorizr}}
import 'core/{{name.snakeCase()}}.dart';
import 'logs/{{name.snakeCase()}}_provider_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // add more configurations here
  runApp(
    ProviderScope(
      observers: [{{name.pascalCase()}}ProviderObserver({{name.camelCase()}}Talker)],
      child: const {{name.pascalCase()}}(),
   )
  );
}
