import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['name'];
  // Run `flutter packages get` after generation.
  var progress = context.logger.progress('Installing packages...');
  await io.Process.run(
    'flutter',
    ['packages', 'get'],
    workingDirectory: './$name',
  );
  progress.complete();

  // Run `flutter pub run build_runner build -d` after package get
  progress = context.logger.progress('Running `build_runner`...');
  await io.Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '-d'],
    workingDirectory: './$name',
  );
  progress.complete();
}
