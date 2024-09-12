import 'dart:io' as io;

import 'package:mason/mason.dart';

import '../context_variables.dart';

Future<void> createBaseProject(HookContext context) async {
  final name = context.name;
  final description = context.description;
  final org = context.org;
  final platforms = context.formattedPlatforms;
  final _ = await io.Process.run(
    'flutter',
    [
      'create',
      name,
      '--no-pub',
      '--no-overwrite',
      '--description',
      '"$description"',
      '--org',
      org,
      '--platforms',
      platforms,
    ],
  );
}
