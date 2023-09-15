import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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

import '../logs/http_logger.dart';



{{#codegen}}
part 'http_client.g.dart';
@riverpod
Dio httpClient(HttpClientRef ref) {
{{/codegen}}
{{^codegen}}
final httpClientProvider = Provider.autoDispose<Dio>((ref) {
{{/codegen}}
  final httpLogger = ref.watch(httpLoggerProvider);

  final options = BaseOptions(
    baseUrl: '$baseUrl/api/v1',
    // TODO customize these options
    receiveTimeout: 12.seconds,
    sendTimeout: 12.seconds,
    connectTimeout: 12.seconds,
  );

  final dio = Dio(options);

  final loggerInterceptor = _MyPrettyDioLogger(
    logPrint: httpLogger.info,
    requestBody: true,
    requestHeader: true,
    // responseBody: false,
  );
  if (kDebugMode) dio.interceptors.add(loggerInterceptor);

  // TODO define more interceptors..?

  ref.onDispose(dio.close);
  return dio;
{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}
const baseUrl = 'some-url';  // TODO: edit or add custom logic elsewhere

// Custom workaround with `SocketException` not being well captured by `DioException`
class _MyPrettyDioLogger extends PrettyDioLogger {
  _MyPrettyDioLogger({
    super.requestHeader = false,
    super.requestBody = false,
    super.logPrint = print,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error && err.type == DioExceptionType.unknown && err.error is io.SocketException) {
      _printBoxed(header: 'DioError ║ ${err.type}', text: '${err.error}');
    }

    super.onError(err, handler);
  }

  void _printBoxed({String? header, String? text}) {
    logPrint('');
    logPrint('╔╣ $header');
    logPrint('║  $text');
    _printLine('╚');
  }

  void _printLine([String pre = '', String suf = '╝']) => logPrint('$pre${'═' * maxWidth}$suf');
}
