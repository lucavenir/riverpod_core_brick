import 'package:mason/mason.dart';

import 'execute_and_log.dart';
import 'post/add_dependencies.dart';
import 'post/create_base_project.dart';
import 'post/get_dependencies.dart';
import 'post/run_build_runner.dart';

Future<void> run(HookContext context) async {
  await executeAndLog(context: context, cb: createBaseProject, message: 'Creating base project..');
  await Future<void>.delayed(_duration);

  await executeAndLog(context: context, cb: addDependencies, message: 'Adding packages..');
  await Future<void>.delayed(_duration);

  await executeAndLog(context: context, cb: getDependencies, message: 'Installing packages..');
  await Future<void>.delayed(_duration);

  final anyCodegen = context.vars['anyCodegen'] as bool;
  if (!anyCodegen) return;
  await executeAndLog(context: context, cb: runBuildRunner, message: 'Running `build_runner`..');
}

const _duration = Duration(milliseconds: 600);
