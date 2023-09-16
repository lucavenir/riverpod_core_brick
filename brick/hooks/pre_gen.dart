import 'package:mason/mason.dart';

import 'pre/compute_flavors.dart';
import 'pre/supported_platforms.dart';
import 'pre/validate_flavor.dart';
import 'pre/validate_name.dart';
import 'pre/validate_org.dart';

Future<void> run(HookContext context) async {
  // Asserting our dart package name
  final name = context.vars['name'] as String;
  assertValidDartPackageName(name);

  // Asserting org name and computing a reversed one
  final org = context.vars['org'] as String;
  assertValidOrg(org);
  context.vars['reversedOrg'] = org.split('.').reversed.join('.');

  // Codegen pre-process
  final usesRiverpodCodegen = context.vars['codegen'] as bool;
  final usesFreezedCodegen = context.vars['freezed'] as bool;
  context.vars['anyCodegen'] = usesRiverpodCodegen || usesFreezedCodegen;

  // Platform assertions and pre-process
  final platforms = context.vars['platforms'] as List<dynamic>;
  final parsedPlatforms = parsePlatforms(platforms.map((e) => e as String));
  context.vars['isCrossPlatform'] = platforms.length > 1;
  context.vars['formattedPlatforms'] = platforms.join(', ');
  context.vars['hasIOs'] = parsedPlatforms.contains(AvailablePlatform.ios);
  context.vars['hasAndroid'] = parsedPlatforms.contains(AvailablePlatform.android);
  context.vars['hasMacOs'] = parsedPlatforms.contains(AvailablePlatform.macos);

  // Flavoring assertions and pre-process
  final hasFlavoring = context.vars['flavors'] as bool;
  Future<void> handleFlavoring() async {
    assertViableFlavoring(parsedPlatforms);
    final logger = Logger();
    final firstPrompt = "Please input the main flavor's name";
    final main = await logger.prompt(firstPrompt, defaultValue: 'production');
    assertValidFlavorName(main);
    context.vars['mainFlavor'] = main.lowerCase;
    final secondPrompt = "Please input other flavors' names";
    final otherFlavors = await logger.promptAny(secondPrompt);
    context.vars['otherFlavors'] = computeFlavors(otherFlavors);
  }

  if (hasFlavoring) await handleFlavoring();
}
