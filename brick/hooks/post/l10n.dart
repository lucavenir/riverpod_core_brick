import 'dart:io' as io;

import 'package:mason/mason.dart';

import '../context_variables.dart';

Future<void> generateL10n(HookContext context) async {
  final _ = await io.Process.run(
    'flutter',
    ['gen-l10n'],
    workingDirectory: './${context.name}',
  );
}
