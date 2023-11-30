import 'core/{{name.snakeCase()}}.dart';
import 'core/{{name.snakeCase()}}_flavors.dart';
import 'core/init.dart';

void main() => initWith({{name.pascalCase()}}Flavor.development);
