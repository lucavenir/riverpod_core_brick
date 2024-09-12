import 'package:mason/mason.dart';

Future<void> executeLogAndWait({
  required HookContext context,
  required Future<void> Function(HookContext context) cb,
  required String message,
}) async {
  final progress = context.logger.progress(message);
  await cb(context);
  progress.complete();
  await Future<void>.delayed(const Duration(milliseconds: 600));
}
