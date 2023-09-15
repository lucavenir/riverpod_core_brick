import 'package:mason/mason.dart';

import 'supported_platforms.dart';
import 'validate_name.dart';
import 'validate_org.dart';

void run(HookContext context) {
  // Read vars.
  final name = context.vars['name'] as String;
  assertValidDartPackageName(name);
  final usesRiverpodCodegen = context.vars['codegen'] as bool;
  final usesFreezedCodegen = context.vars['freezed'] as bool;
  final org = context.vars['org'] as String;
  assertValidOrg(org);
  final platforms = context.vars['platforms'] as List<dynamic>;
  final parsedPlatforms = parsePlatforms(platforms.map((e) => e as String));
  assertViableFlavoring(parsedPlatforms);

  // Update vars.
  context.vars['anyCodegen'] = usesRiverpodCodegen || usesFreezedCodegen;
  context.vars['reversedOrg'] = org.split('.').reversed.join('.');
  context.vars['isCrossPlatform'] = platforms.length > 1;
  context.vars['formattedPlatforms'] = platforms.join(', ');
}
