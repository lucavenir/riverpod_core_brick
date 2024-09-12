import 'dart:io' as io;

import 'package:mason/mason.dart';

import '../context_variables.dart';

Future<void> addDependencies(HookContext context) async {
  final dependencies = [
    if (context.hooks) 'hooks_riverpod' else 'flutter_riverpod',
    if (context.hooks) 'flutter_hooks',
    if (context.codegen) 'riverpod_annotation',
    if (context.freezed) 'freezed_annotation',
    if (context.freezed) 'json_annotation',
    'cached_network_image',
    'collection',
    'connectivity_plus',
    'dio',
    'flutter_animate',
    'flutter_use',
    'auto_route',
    'google_fonts',
    'intl',
    'package_info_plus',
    'talker_flutter',
    'talker_dio_logger',
    'stack_trace',
  ];

  final devDependencies = [
    if (context.anyCodegen) 'build_runner',
    if (context.anyCodegen) 'auto_route_generator',
    if (context.freezed) 'freezed',
    if (context.freezed) 'json_serializable',
    if (context.codegen) 'riverpod_generator',
    if (context.hasFlavoring) 'flutter_flavorizr',
    'flutter_gen',
    'custom_lint',
    'flutter_lints',
    'http_mock_adapter',
    'mocktail',
    'riverpod_lint',
    'very_good_analysis',
  ];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'add', ...dependencies, ...devDependencies.map((e) => 'dev:$e')],
    workingDirectory: './${context.name}',
  );
}
