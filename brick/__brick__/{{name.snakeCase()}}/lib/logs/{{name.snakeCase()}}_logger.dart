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
}
