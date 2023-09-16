import 'package:mason/mason.dart';

import 'execute_and_log.dart';
import 'post/add_dependencies.dart';
import 'post/add_flavors.dart';
import 'post/create_base_project.dart';
import 'post/get_base_dependencies.dart';
import 'post/run_build_runner.dart';

Future<void> run(HookContext context) async {
  await executeAndLog(context: context, cb: createBaseProject, message: 'Creating base project..');
  await executeAndLog(context: context, cb: getBaseDependencies, message: 'Installing packages..');
  await executeAndLog(context: context, cb: addDependencies, message: 'Adding packages..');
  await executeAndLog(context: context, cb: addFlavors, message: 'Running `flutter_flavorizr`..');
  await executeAndLog(context: context, cb: runBuildRunner, message: 'Running `build_runner`..');
}
