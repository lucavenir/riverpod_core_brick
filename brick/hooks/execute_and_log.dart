import 'package:mason/mason.dart';

Future<void> executeAndLog({
  required HookContext context,
  required Future<void> Function(HookContext context) cb,
  required String message,
}) async {
  final progress = context.logger.progress(message);
  await cb(context);
  progress.complete();
}
