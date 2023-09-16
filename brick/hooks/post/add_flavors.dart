import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> addFlavors(HookContext context) async {
  final name = context.vars['name'];
  final isAndroid = context.vars['android'] as bool;
  final isIOs = context.vars['isIOs'] as bool;
  final isMacOs = context.vars['isMacOs'] as bool;

  final processors = [
    'assets:download',
    'assets:extract',
    'flutter:targets',
    'ide:config',
    if (isAndroid) ...[
      'android:androidManifest',
      'android:buildGradle',
      'android:icons',
    ],
    if (isIOs) ...[
      'ios:xcconfig',
      'ios:buildTargets',
      'ios:schema',
      'ios:icons',
      'ios:plist',
      'ios:launchScreen',
    ],
    if (isMacOs) ...[
      'macos:xcconfig',
      'macos:configs',
      'macos:buildTargets',
      'macos:schema',
      'macos:icons',
      'macos:plist',
      'assets:clean',
    ],
  ];

  await io.Process.run(
    'flutter',
    ['pub', 'run', 'flutter_flavorizr', '--processors', processors.join(',')],
    workingDirectory: './$name',
  );
}
