
import 'package:logging/logging.dart';
{{#codegen}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
{{/codegen}}
{{^codegen}}
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
{{/codegen}}
import 'logger_color.dart';

{{#codegen}}
part 'http_logger.g.dart';

@riverpod
Logger httpLogger(HttpLoggerRef ref) {
{{/codegen}}
{{^codegen}}
final httpLoggerProvider = Provider.autoDispose<Logger>((ref) {
{{/codegen}}

  final httpLogger = Logger('DIO');
  httpLogger.level = Level.INFO;
  final logger = {{name.pascalCase()}}Logger(logger: httpLogger, color: LoggerColor.green);

  final subscription = httpLogger.onRecord.listen(logger.recordLogs);

  ref.onDispose(subscription.cancel);

  return httpLogger;
{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}
