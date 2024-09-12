import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
import 'package:auto_route/auto_route.dart';

import '../l10n/l10n.dart';
import '../router/router.dart';

class {{name.pascalCase()}} extends ConsumerWidget {
  const {{name.pascalCase()}}({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return  MaterialApp.router(
      routerConfig: router.config(),
      // theme: lightTheme,  // TODO
      // darkTheme: darkTheme,  // TODO
      localizationsDelegates: {{name.pascalCase()}}Localizations.localizationsDelegates,
      supportedLocales: {{name.pascalCase()}}Localizations.supportedLocales,
    );
  }
}
