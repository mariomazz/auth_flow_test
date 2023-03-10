import 'package:auth_flow_test/src/common/extensions/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'error_logger.dart';

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    errorLogger.logError(details.exception, details.stack);
    FlutterError.presentError(details);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString()).list()),
    );
  };
}
