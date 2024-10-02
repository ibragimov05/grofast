import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'core/theme/theme.dart';
import 'router/app_router.dart';
import 'services/services.dart';
import 'core/l10n/localization.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) => NotificationService.showNotification(message),
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) => log("Opened app from notification!"),
    );
  }

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
