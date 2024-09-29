import 'package:flutter/material.dart';

import 'core/l10n/localization.dart';
import 'core/theme/theme.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      /// router
      routerConfig: router,

      /// theme
      theme: lightTheme,
      darkTheme: darkTheme,

      /// locale
      locale: const Locale('uz'),
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.delegates,
    );
  }
}
