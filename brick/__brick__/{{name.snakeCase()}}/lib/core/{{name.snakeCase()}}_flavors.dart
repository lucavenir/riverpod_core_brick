
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

{{#codegen}}
part '{{name.snakeCase()}}_flavors.g.dart';
@riverpod
{{name.pascalCase()}}Flavor flavor(FlavorRef ref) {
{{/codegen}}
{{^codegen}}
final flavorProvider = Provider.autoDispose<{{name.pascalCase()}}Flavor>((ref) {
{{/codegen}}
  throw UnimplementedError('This provider is meant to be overridden');
{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}

enum {{name.pascalCase()}}Flavor {
  development(title: '[DEV] {{name.titleCase()}}'),
  staging(title: '[STG] {{name.titleCase()}}'),
  production(title: '{{name.titleCase()}}');

  const {{name.pascalCase()}}Flavor({required this.title});
  final String title;

  // add flavor-related configurations getters and methods, if needed
  // example:
  String obtainAppId(String fullPackageName) {
    if (this == production) return fullPackageName;

    final split = fullPackageName.split('.');
    final splitWithoutFlavor = split.sublist(0, split.length - 1);
    final actualPackageName = splitWithoutFlavor.join('.');
    return actualPackageName;
  }
}
