import 'package:flutter/foundation.dart';

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    debugPrint('$error, $stackTrace');
  }

  void logAppException(Exception exception) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$exception');
  }
}
