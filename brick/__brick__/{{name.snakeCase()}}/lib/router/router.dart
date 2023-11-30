import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:go_router/go_router.dart';
{{#codegen}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
{{/codegen}}
{{^codegen}}
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
{{/codegen}}

import '../src/authentication/presentation/controllers/authentication_controller.dart';
import '../clients/talker.dart';
import 'routes_configuration.dart';

{{#codegen}}
part 'router.g.dart';
@riverpod
GoRouter router(RouterRef ref) {
{{/codegen}}
{{^codegen}}
final routerProvider = Provider.autoDispose<GoRouter>((ref) {
{{/codegen}}
  final key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  final listenable = ValueNotifier<bool>(false);  // e.g. some authentication
  ref.onDispose(listenable.dispose);
  final subscription = ref.listen(
    authenticationControllerProvider,
    (_, next) => listenable.value = next,
    fireImmediately: true,
  );
  ref.onDispose(subscription.close);
  final initialLocation = ref.watch(initialLocationProvider);
  final talker = ref.watch(talkerProvider);

  final router = GoRouter(
    navigatorKey: key,
    observers: [TalkerRouteObserver(talker)],
    initialLocation: initialLocation,
    refreshListenable: listenable,
    // TODO define your custom global redirect logic based on state, if any
    redirect: (context, state) => null,
    routes: $appRoutes,
  );
  ref.onDispose(router.dispose);

  return router;
{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}


{{#codegen}}
@riverpod
String initialLocation(InitialLocationRef ref) => '/'; // TODO customize
{{/codegen}}
{{^codegen}}
final initialLocationProvider = Provider.autoDispose<String>((ref) => '/'); // TODO customize
{{/codegen}}
