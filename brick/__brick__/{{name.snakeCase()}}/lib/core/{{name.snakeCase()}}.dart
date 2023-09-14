import 'package:flutter/material.dart';
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
import 'package:go_router/go_router.dart';
import 'package:{{name.snakeCase()}}/l10n/l10n.dart';

import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';

{{#hooks}}
class {{name.pascalCase()}} extends HookConsumerWidget {
  const {{name.pascalCase()}}({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerNotifierProvider.notifier);

    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'routerKey'));
    final router = useMemoized(
      () => GoRouter(
        navigatorKey: key.value,
        debugLogDiagnostics: kDebugMode,
        initialLocation: const SplashRoute().location,
        refreshListenable: notifier,
        // TODO handle when non-codegen
        routes: $appRoutes,
      ),
    );
    useEffect(() => router.dispose, [router]);
    
    return  MaterialApp.router(
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
{{/hooks}}

{{^hooks}}
class {{name.pascalCase()}} extends StatefulWidget {
  const {{name.pascalCase()}}({super.key});

  @override
  State<{{name.pascalCase()}}> createState() => _{{name.pascalCase()}}State();
}

class _{{name.pascalCase()}}State extends State<{{name.pascalCase()}}> {
  late final GoRouter router;
  late final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  @override
  void initState() {
    super.initState();
    final notifier = ref.read(routerNotifierProvider.notifier);
    router = GoRouter(
      navigatorKey: routerKey,
      debugLogDiagnostics: kDebugMode,
      initialLocation: const SplashRoute().location,
      refreshListenable: notifier,
      routes: $appRoutes,
    );
  }

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
{{/hooks}}
