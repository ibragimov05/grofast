import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:grofast/core/theme/theme_data.dart';

import 'core/l10n/localization.dart';
import 'router/app_router.dart';

part 'app.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
  await showNotification(message);
}

Future<void> showNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(const AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.high,
      ));

  // try {
  //     await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     );
  //     await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  //
  //     final firebaseAPI = FirebaseApi();
  //
  //     firebaseAPI.initNotifications();
  //
  //     // await FirebaseMessaging.instance.getInitialMessage();
  //     // await FirebaseMessaging.instance.requestPermission();
  //     // await NotificationService.initNotification();
  //
  //     // _getToken();
  //   } catch(e) {
  //     print("Failed to initialize Firebase: $e");
  //   }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(App());
}
