import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:grofast/services/firebase_api.dart';
import 'package:grofast/services/notification_service.dart';

import 'app.dart';
import 'core/utils/utils.dart';
import 'dependency_setup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    final firebaseAPI = FirebaseApi();

    firebaseAPI.initNotifications();

    // await FirebaseMessaging.instance.getInitialMessage();
    // await FirebaseMessaging.instance.requestPermission();
    // await NotificationService.initNotification();

    // _getToken();
  } catch(e) {
    print("Failed to initialize Firebase: $e");
  }

  if (kDebugMode) Bloc.observer = LogBlocObserver();

  DependencySetup.init();

  FlutterNativeSplash.remove();

  runApp(const App());
}

void _getToken() {
  FirebaseMessaging.instance.getToken().then((value) {
    print("TOKEN IS :: :: $value");
  });
}