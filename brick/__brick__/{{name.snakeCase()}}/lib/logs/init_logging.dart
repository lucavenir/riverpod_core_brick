import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

import '../logs/{{name.snakeCase()}}_observer.dart';
import '../logs/{{name.snakeCase()}}_logs_color.dart';

{{name.pascalCase()}}Observer initProviderObserver()  {
  final riverpodLogger = _createRiverpodLogger();
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

  final baseLogger = _createBaseLogger();
  FlutterError.onError = (details) => baseLogger.severe(
        details.exceptionAsString(),
        details.exception,
        details.stack,
      );
}

{{name.pascalCase()}}Logger _createRiverpodLogger() {
  final riverpodLogger = Logger('Riverpod');
  riverpodLogger.level = Level.FINEST;
  final logger = {{name.pascalCase()}}Logger(logger: riverpodLogger, color: LoggerColor.white);

  riverpodLogger.onRecord.listen(logger.recordLogs);

  return logger;
}

{{name.pascalCase()}}Logger _createBaseLogger() {
  final baseLogger = Logger('{{name.titleCase()}}');
  baseLogger.level = Level.SEVERE;
  final logger = {{name.pascalCase()}}Logger(logger: baseLogger, color: LoggerColor.magenta);

  baseLogger.onRecord.listen(logger.recordLogs);

  return baseLogger;
}