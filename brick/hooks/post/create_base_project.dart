import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> createBaseProject(HookContext context) async {
  final name = context.vars['name'];
  final progress = context.logger.progress('Creating base project...');
  final description = context.vars['description'];
  final org = context.vars['org'];
  final platforms = context.vars['formattedPlatforms'];
  final process = await io.Process.run(
    'flutter',
    [
      'create',
      '$name',
      '--empty',
      '--no-pub',
      '--overwrite',
      '--description',
      '"$description"',
      '--org',
      '$org',
      '--platforms',
      '$platforms',
    ],
  );
  print(process.stderr);
  print(process.stdout);

  progress.complete();
}
