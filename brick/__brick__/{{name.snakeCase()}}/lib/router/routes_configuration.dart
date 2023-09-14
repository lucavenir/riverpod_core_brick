import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

import '../src/counter/presentation/pages/counter_page.dart';

// TODO: add and customize routes here
{{#codegen}}
part 'routes_configuration.g.dart';

@TypedGoRoute<CounterRoute>(path: '/')
class CounterRoute extends GoRouteData {
  const CounterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterPage();
  }
}
{{/codegen}}
{{^codegen}}
final $appRoutes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const CounterPage(),
  )
];
{{/codegen}}