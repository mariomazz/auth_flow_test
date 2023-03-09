import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'common/utils/breakpoints.dart';
import 'config/themes/theme_dark.dart';
import 'config/themes/theme_light.dart';
import 'routes/router.dart';

class AuthFlowTest extends ConsumerWidget {
  const AuthFlowTest({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "app",
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: Breakpoint.desktopL,
        minWidth: Breakpoint.mobile,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(Breakpoint.mobile, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(Breakpoint.tablet, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(Breakpoint.tablet, name: TABLET),
          const ResponsiveBreakpoint.autoScale(Breakpoint.tabletL,
              name: TABLET),
          const ResponsiveBreakpoint.resize(Breakpoint.desktop, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(Breakpoint.desktopL, name: "4K"),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
    );
  }
}
