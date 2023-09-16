import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> createBaseProject(HookContext context) async {
  final name = context.vars['name'];
  final progress = context.logger.progress('Creating base project...');
  final description = context.vars['description'];
  final org = context.vars['org'];
  final platforms = context.vars['formattedPlatforms'];
  final shouldOverwrite = context.vars['overwrite'] as bool;
  final overwriteOption = shouldOverwrite ? '' : 'no-';
  await io.Process.run(
    'flutter create $name',
    [
      '-e',
      '--project-name $name',
      '--no-pub',
      '--${overwriteOption}overwrite',
      '--description "$description"',
      '--org $org',
      '--platforms $platforms',
    ],
    workingDirectory: './$name',
  );
  progress.complete();
}
