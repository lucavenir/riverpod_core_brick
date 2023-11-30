import 'package:talker_flutter/talker_flutter.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:flutter/foundation.dart';

import '../logs/{{name.snakeCase()}}_talker_observer.dart';

Talker initTalker() {
  const talkerObserver = {{name.pascalCase()}}TalkerObserver();
  final talker = Talker(
    observer: kReleaseMode ? null : talkerObserver,
    logger: TalkerLogger(
      output: (String message) => message.split('\n').forEach(debugPrintSynchronously),
      settings: TalkerLoggerSettings(
        colors: {
          LogLevel.verbose: AnsiPen()..cyan(),
          LogLevel.info: AnsiPen()..white(),
        },
        level: LogLevel.debug,
        maxLineWidth: 120,
      ),
    ),
  );

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
        details.exceptionAsString(),
      );
  
  return talker;
}