import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> generateL10n(HookContext context) async {
  final name = context.vars['name'];
  final _ = await io.Process.run(
    'flutter',
    ['gen-l10n'],
    workingDirectory: './$name',
  );
}
