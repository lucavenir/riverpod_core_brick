import 'package:mason/mason.dart';

void run(HookContext context) {
  // Read vars.
  final usesRiverpodCodegen = context.vars['codegen'] as bool;
  final usesFreezedCodegen = context.vars['freezed'] as bool;

  // Update vars.
  context.vars['anyCodegen'] = usesRiverpodCodegen || usesFreezedCodegen;
}
