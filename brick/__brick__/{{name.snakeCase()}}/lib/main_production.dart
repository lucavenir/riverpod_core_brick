import 'core/{{name.snakeCase()}}.dart';
import '{{name.snakeCase()}}.dart';
import 'core/{{name.snakeCase()}}_flavors.dart';
import 'core/init.dart';

void main() => init(
  flavor: {{name.pascalCase()}}Flavor.production,
  builder: () => const {{name.pascalCase()}}(),
);