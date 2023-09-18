import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> createBaseProject(HookContext context) async {
  final name = context.vars['name'];
  final description = context.vars['description'];
  final org = context.vars['org'];
  final platforms = context.vars['formattedPlatforms'];
  final _ = await io.Process.run(
    'flutter',
    [
      'create',
      '$name',
      '--no-pub',
      '--no-overwrite',
      '--description',
      '"$description"',
      '--org',
      '$org',
      '--platforms',
      '$platforms',
    ],
  );
}
