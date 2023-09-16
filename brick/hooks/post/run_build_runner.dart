import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> runBuildRunner(HookContext context) async {
  final anyCodegen = context.vars['anyCodegen'] as bool;
  if (!anyCodegen) return;
  final name = context.vars['name'];
  final process = await io.Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '-d'],
    workingDirectory: './$name',
  );
  print(process.stderr);
  print(process.stdout);
}
