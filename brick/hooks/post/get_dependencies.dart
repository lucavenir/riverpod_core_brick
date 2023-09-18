import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> getDependencies(HookContext context) async {
  final name = context.vars['name'];
  final _ = await io.Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: './$name',
  );
}
