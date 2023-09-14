import 'dart:developer' as dev;

import 'package:logging/logging.dart';

import 'logger_color.dart';

final class {{name.pascalCase()}}Logger {
  {{name.pascalCase()}}Logger({
    required this.logger,
    required this.color,
  });
  final LoggerColor color;
  final Logger logger;

  String coloredLog(String input) => '\x1B[${color.colorCode}$input\x1B[0m';

  void recordLogs(LogRecord record) => dev.log(
      coloredLog(record.message),
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      name: record.loggerName,
      time: record.time,
      zone: record.zone,
    );
}
