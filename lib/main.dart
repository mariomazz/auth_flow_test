import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/app.dart';
import 'src/common/exceptions/error_logger.dart';
import 'src/common/exceptions/register_error_handlers.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded<Future<void>>(
    () async {
      registerErrorHandlers(ErrorLogger());
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      setPathUrlStrategy();
      await EasyLocalization.ensureInitialized();
      FlutterNativeSplash.remove();
      return runApp(
        EasyLocalization(
          path: 'assets/l10n',
          supportedLocales: const [Locale('it', 'IT'), Locale('en', 'US')],
          fallbackLocale: const Locale('en', 'US'),
          child: const ProviderScope(
            child: AuthFlowTest(),
          ),
        ),
      );
    },
    (err, stacktrace) {
      if (kDebugMode) {
        print("MAIN Exception => ${err.toString()}");
      }
    },
  );
}
