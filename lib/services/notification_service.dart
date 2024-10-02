// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint("Handling a background message: ${message.messageId}");
//   await showNotification(message);
// }
//
// Future<void> showNotification(RemoteMessage message) async {
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//
//   if (notification != null && android != null) {
//     await NotificationService.flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           'high_importance_channel',
//           'High Importance Notifications',
//           importance: Importance.high,
//           priority: Priority.high,
//           icon: 'ic_notification',
//         ),
//       ),
//     );
//   }
// }
//
// class NotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static const AndroidInitializationSettings _initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//
//   static Future<void> initNotification() async {
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: _initializationSettingsAndroid);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation;
//
//     AndroidFlutterLocalNotificationsPlugin().createNotificationChannel(
//       const AndroidNotificationChannel(
//         'high_importance_channel',
//         'High Importance Notifications',
//         importance: Importance.high,
//       ),
//     );
//
//     await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   static showLocalNotification(String title, String body, String payload) {
//     const androidNotificationDetail = AndroidNotificationDetails(
//       '0',
//       'general',
//       priority: Priority.high,
//       autoCancel: false,
//       fullScreenIntent: true,
//       enableVibration: true,
//       importance: Importance.high,
//       playSound: true,
//     );
//     const iosNotificationDetail = DarwinNotificationDetails();
//
//     const notificationDetails = NotificationDetails(
//       iOS: iosNotificationDetail,
//       android: androidNotificationDetail,
//     );
//     flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails,
//         payload: payload);
//   }
// }
