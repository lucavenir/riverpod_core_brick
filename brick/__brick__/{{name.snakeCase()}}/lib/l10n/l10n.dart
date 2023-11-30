import 'package:flutter/widgets.dart';
import 'gen/{{name.snakeCase()}}_app_localizations.dart';

export 'gen/{{name.snakeCase()}}_app_localizations.dart';

extension {{name.pascalCase()}}LocalizationsX on BuildContext {
  {{name.pascalCase()}}Localizations get l10n => {{name.pascalCase()}}Localizations.of(this);
}
