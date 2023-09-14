{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
import '{{name.snakeCase()}}_logger.dart';

class {{name.pascalCase()}}Observer extends ProviderObserver {
  const {{name.pascalCase()}}Observer(this._logger);
  final {{name.pascalCase()}}Logger _logger;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logger.logger
      ..finest('$provider has been created')
      ..finest('\tValue: $value');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _error(provider, error, stackTrace);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue case AsyncError()) return _error(provider, newValue.error, newValue.stackTrace);

    _logger.logger
      ..finest('$provider updated')
      ..finest('\tOld value: $previousValue')
      ..finest('\tNew value: $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _logger.logger.fine('$provider has been disposed');
  }

  void _error(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
  ) {
    _logger.logger
      ..severe('$provider raised an Exception')
      ..severe('\tError: $error')
      ..severe('\tStack Trace: $stackTrace');
  }
}
