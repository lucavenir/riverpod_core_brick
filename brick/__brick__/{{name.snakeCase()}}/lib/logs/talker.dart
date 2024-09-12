import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '{{name.snakeCase()}}_talker_observer.dart';


final {{name.camelCase()}}Talker = TalkerFlutter.init(
  observer: kReleaseMode ? null : {{name.camelCase()}}TalkerObserver,
  logger: TalkerLogger(
    output: (String message) => message //
        .split('\n')
        .forEach(debugPrintSynchronously),
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
