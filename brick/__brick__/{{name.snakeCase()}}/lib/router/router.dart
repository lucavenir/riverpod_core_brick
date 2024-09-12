import 'package:auto_route/auto_route.dart';
{{#codegen}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
{{/codegen}}
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}

{{#codegen}}
part 'router.g.dart';
part 'router.gr.dart';

@riverpod
{{name.pascalCase()}}Router router(RouterRef ref) {
{{/codegen}}
{{^codegen}}
final routerProvider = Provider.autoDispose<{{name.pascalCase()}}Router>((ref) {
{{/codegen}}
  return {{name.pascalCase()}}Router(ref);
{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}

@AutoRouterConfig()
class {{name.pascalCase()}}Router extends RootStackRouter {
  {{name.pascalCase()}}Router(this.ref);
  final Ref ref;  // TODO(whoever): this might be useful later

  @override
  List<AutoRoute> get routes => [
      // TODO(whoever): config your routes here
      ];
}
