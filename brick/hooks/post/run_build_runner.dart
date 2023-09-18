import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> runBuildRunner(HookContext context) async {
  final name = context.vars['name'];
  final _ = await io.Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '-d'],
    workingDirectory: './$name',
  );
}
