import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  // Run `flutter packages get` after generation.
  final progress = context.logger.progress('Installing packages');
  await io.Process.run('flutter', ['packages', 'get']);
  progress.complete();
}
