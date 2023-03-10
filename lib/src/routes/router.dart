import 'package:auth_flow_test/src/common/widgets/error_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/login/presentation/login_screen.dart';
import '../localization/locale_keys.g.dart';
import 'constants.dart';
import 'router_refresh_stream.dart';
part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: rootRoute,
    refreshListenable: GoRouterRefreshStream(streams: []),
    routes: [
      GoRoute(
        path: rootRoute,
        redirect: (ctx, state) => loginRoute,
      ),
      GoRoute(
        path: loginRoute,
        pageBuilder: (context, state) {
          final queryParameters = state.queryParametersAll
              .map((key, value) => MapEntry(key.toLowerCase(), value));
          if (!((queryParameters.keys.any((element) =>
                  element.toLowerCase() == "redirectUri".toLowerCase())) &&
              (queryParameters["redirectUri".toLowerCase()]?.isNotEmpty ??
                  false))) {
            return _buildPageWithFadeTransition(
              context: context,
              state: state,
              child: ErrorScreen(
                error: LocaleKeys.errors_messages_redirect_uri_required.tr(),
              ),
            );
          }
          final redirectUriAfterLogin =
              (queryParameters['redirectUri'.toLowerCase()] ?? []).first;
          return _buildPageWithFadeTransition(
            context: context,
            state: state,
            child: LoginScreen(redirectUriAfterLogin: redirectUriAfterLogin),
          );
        },
      ),
    ],
    redirect: (context, state) async {
      return null;
    },
    debugLogDiagnostics: true,
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorScreen(
        error: LocaleKeys.errors_messages_default.tr(),
      ),
    ),
  );
}

// ignore: unused_element
CustomTransitionPage<Object> _buildPageWithModalTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<Object>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeIn)),
            ),
            child: child),
  );
}

CustomTransitionPage<Object> _buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<Object>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
