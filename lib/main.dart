import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:grofast/services/services.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'services/notification_service.dart';

/// Handles incoming background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
  await NotificationService.showNotification(message);
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Future.wait([
      FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true),
      NotificationService.initializeNotifications(),
    ]);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } catch (e) {
    log("Failed to initialize Firebase: $e");
  }

  runApp(App());

  FlutterNativeSplash.remove();
}
