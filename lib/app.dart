
part of 'main.dart';
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print("Got a message whilst in the foreground!");
      }
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print("Opened app from notification!");
      }
    });
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
