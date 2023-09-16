import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> getBaseDependencies(HookContext context) async {
  final name = context.vars['name'];
  await io.Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: './$name',
  );
}
