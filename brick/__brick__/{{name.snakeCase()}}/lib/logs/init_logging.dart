import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

import '../logs/{{name.snakeCase()}}_observer.dart';
import '../logs/{{name.snakeCase()}}_logs_color.dart';
import '{{name.snakeCase()}}_logger.dart';


{{name.pascalCase()}}Observer initProviderObserver()  {
  final riverpodLogger = createRiverpodLogger();
  final observer = {{name.pascalCase()}}Observer(riverpodLogger);

  return observer;
}

void initErrorReporting() {
  hierarchicalLoggingEnabled = true;
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  final baseLogger = createBaseLogger();
  FlutterError.onError = (details) => baseLogger.logger.severe(
        details.exceptionAsString(),
        details.exception,
        details.stack,
      );
}

{{name.pascalCase()}}Logger createRiverpodLogger() {
  final riverpodLogger = Logger('Riverpod')..level=Level.FINEST;
  final logger = {{name.pascalCase()}}Logger(logger: riverpodLogger, color: LoggerColor.white);

  riverpodLogger.onRecord.listen(logger.recordLogs);

  return logger;
}

{{name.pascalCase()}}Logger createBaseLogger() {
  final baseLogger = Logger('{{name.titleCase()}}')..level=Level.SEVERE;
  final logger = {{name.pascalCase()}}Logger(logger: baseLogger, color: LoggerColor.magenta);

  baseLogger.onRecord.listen(logger.recordLogs);

  return logger;
}