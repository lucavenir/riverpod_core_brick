import 'package:mason/mason.dart';

import 'context_variables.dart';
import 'execute_and_log.dart';
import 'post/add_dependencies.dart';
import 'post/create_base_project.dart';
import 'post/l10n.dart';
import 'post/run_build_runner.dart';
import 'post/upgrade_dependencies.dart';

Future<void> run(HookContext context) async {
  await executeLogAndWait(
    context: context,
    cb: createBaseProject,
    message: 'Creating base project..',
  );

  await executeLogAndWait(
    context: context,
    cb: addDependencies,
    message: 'Adding dependencies..',
  );

  await executeLogAndWait(
    context: context,
    cb: upgradeDependencies,
    message: 'Upgrading dependencies..',
  );

  await executeLogAndWait(
    context: context,
    cb: generateL10n,
    message: 'Generating base l10n files..',
  );

  if (!context.anyCodegen) return;
  await executeLogAndWait(
    context: context,
    cb: runBuildRunner,
    message: 'Running `build_runner`..',
  );
}
