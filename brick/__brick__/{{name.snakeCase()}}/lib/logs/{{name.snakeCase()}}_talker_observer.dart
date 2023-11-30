import 'package:talker_flutter/talker_flutter.dart';

class {{name.PascalCase()}}TalkerObserver extends TalkerObserver {
  const {{name.PascalCase()}}TalkerObserver();

  @override
  void onError(TalkerError err) => _capture(err);
  @override
  void onException(TalkerException err) => _capture(err);

  Future<void> _capture(TalkerDataInterface err) {
    // TODO intercept errors and send them remotely (e.g. Sentry, Firebase Crashlytics, etc.)
  }
}
