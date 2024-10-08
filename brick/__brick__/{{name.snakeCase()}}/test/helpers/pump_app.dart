import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{name.snakeCase()}}/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: {{name.pascalCase()}}Localizations.localizationsDelegates,
        supportedLocales: {{name.pascalCase()}}Localizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
