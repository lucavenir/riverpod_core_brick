import 'package:mason/mason.dart';

import 'context_variables.dart';
import 'pre/flavors.dart';
import 'pre/platforms.dart';
import 'pre/validate_name.dart';
import 'pre/validate_org.dart';

void run(HookContext context) {
  // Asserting our dart package name
  final name = context.name;
  assertValidDartPackageName(name);

  // Asserting org name and computing a reversed one
  final org = context.org;
  assertValidOrg(org);
  context.vars['reversedOrg'] = org.split('.').reversed.join('.');

  // Codegen pre-process
  context.vars['anyCodegen'] = context.codegen || context.freezed;

  // Platform assertions and pre-process
  final platforms = context.platforms;
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
    final main = context.logger.prompt(firstPrompt, defaultValue: 'production').trim().lowerCase;
    assertValidFlavorName(main);
    context.vars['mainFlavor'] = main;
    const secondPrompt = "Please input other flavors' names";
    final otherFlavors = context.logger.promptAny(secondPrompt).map((e) => e.trim());
    final computedFlavors = computeFlavors(otherFlavors);
    context.vars['otherFlavors'] = computedFlavors;
    context.vars['flavors'] = [main, ...computedFlavors];
  }

  if (context.hasFlavoring) handleFlavoring();
}
