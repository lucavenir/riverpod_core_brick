import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> addDependencies(HookContext context) async {
  final name = context.vars['name'];

  final hooks = context.vars['hooks'] as bool;
  final freezed = context.vars['freezed'] as bool;
  final codegen = context.vars['codegen'] as bool;
  final anyCodegen = context.vars['anyCodegen'] as bool;

  final dependencies = [
    if (hooks) 'hooks_riverpod' else 'flutter_riverpod',
    if (hooks) 'flutter_hooks',
    if (codegen) 'riverpod_annotation',
    if (freezed) 'freezed_annotation',
    if (freezed) 'json_annotation',
    'cached_network_image',
    'collection',
    'connectivity_plus',
    'dio',
    'flex_color_scheme',
    'flutter_animate',
    'flutter_use',
    'go_router',
    'google_fonts',
    'intl',
    'logging',
    'package_info_plus',
    'pretty_dio_logger',
    'stack_trace',
  ];

  final devDependencies = [
    if (anyCodegen) 'build_runner',
    if (anyCodegen) 'go_router_builder',
    if (freezed) 'freezed',
    if (freezed) 'json_serializable',
    if (codegen) 'riverpod_generator',
    'custom_lint',
    'flutter_lints',
    'http_mock_adapter',
    'mocktail',
    'riverpod_lint',
    'very_good_analysis',
    'flutter_flavorizr',
  ];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'add', ...dependencies, ...devDependencies],
    workingDirectory: './$name',
  );
}
