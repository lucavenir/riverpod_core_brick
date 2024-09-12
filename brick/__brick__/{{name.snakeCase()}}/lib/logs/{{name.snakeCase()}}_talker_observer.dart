import 'package:talker_flutter/talker_flutter.dart';

final {{name.camelCase()}}TalkerObserver = {{name.pascalCase()}}TalkerObserver();

class {{name.pascalCase()}}TalkerObserver extends TalkerObserver {
  const {{name.pascalCase()}}TalkerObserver();

  @override
  void onError(TalkerError err) => _capture(err);
  @override
  void onException(TalkerException err) => _capture(err);

  Future<void> _capture(TalkerData err) async {
    // TODO intercept errors and send them remotely (e.g. Sentry, Firebase Crashlytics, etc.)
  }
}
