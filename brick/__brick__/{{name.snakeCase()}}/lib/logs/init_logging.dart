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

  riverpodLogger.onRecord.listen(
    (record) => dev.log(
      logger.coloredLog(record.message),
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      name: record.loggerName,
      time: record.time,
      zone: record.zone,
    ),
  );

  return logger;
}

{{name.pascalCase()}}Logger _createBaseLogger() {
  final baseLogger = Logger('{{name.titleCase()}}');
  baseLogger.level = Level.SEVERE;
  final logger = {{name.pascalCase()}}Logger(logger: baseLogger, color: LoggerColor.magenta);

  riverpodLogger.onRecord.listen(
    (record) => dev.log(
      logger.coloredLog(record.message),
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      name: record.loggerName,
      time: record.time,
      zone: record.zone,
    ),
  );

  return baseLogger;
}