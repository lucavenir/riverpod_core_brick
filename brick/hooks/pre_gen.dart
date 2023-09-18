import 'package:mason/mason.dart';

import 'pre/flavors.dart';
import 'pre/platforms.dart';
import 'pre/validate_name.dart';
import 'pre/validate_org.dart';

void run(HookContext context) {
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
  context.vars['isCrossPlatform'] = parsedPlatforms.length > 1;
  context.vars['formattedPlatforms'] = parsedPlatforms.join(',');
  context.vars['hasIOs'] = parsedPlatforms.contains(AvailablePlatform.ios);
  context.vars['hasAndroid'] = parsedPlatforms.contains(AvailablePlatform.android);
  context.vars['hasMacOs'] = parsedPlatforms.contains(AvailablePlatform.macos);
  context.vars['hasWindows'] = parsedPlatforms.contains(AvailablePlatform.windows);
  context.vars['hasWeb'] = parsedPlatforms.contains(AvailablePlatform.web);
  context.vars['hasLinux'] = parsedPlatforms.contains(AvailablePlatform.linux);

  // Flavoring assertions and pre-process
  void handleFlavoring() {
    const firstPrompt = "Please input the main flavor's name";
    final main = context.logger.prompt(firstPrompt, defaultValue: 'production');
    assertValidFlavorName(main);
    context.vars['mainFlavor'] = main.lowerCase;
    const secondPrompt = "Please input other flavors' names";
    final otherFlavors = context.logger.promptAny(secondPrompt);
    context.vars['otherFlavors'] = computeFlavors(otherFlavors);
  }

  final hasFlavoring = context.vars['flavorizr'] as bool;
  if (hasFlavoring) handleFlavoring();
}
