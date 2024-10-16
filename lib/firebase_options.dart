// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCyLBG0D9zf3i7DiZ1HN3hpka3hMJIqXBc',
    appId: '1:1070912617929:web:74f4ed36272ab101907c18',
    messagingSenderId: '1070912617929',
    projectId: 'grofast-4a51c',
    authDomain: 'grofast-4a51c.firebaseapp.com',
    storageBucket: 'grofast-4a51c.appspot.com',
    measurementId: 'G-W08G6JGYVT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQSSQZY-L5_4UKtNUXKcpQQJT9qOiWxps',
    appId: '1:1070912617929:android:373e0ad254f16244907c18',
    messagingSenderId: '1070912617929',
    projectId: 'grofast-4a51c',
    storageBucket: 'grofast-4a51c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiqbSx0uUxD62ZlW_6V_3kGOFRY_Skti4',
    appId: '1:1070912617929:ios:f8cf713b7622e614907c18',
    messagingSenderId: '1070912617929',
    projectId: 'grofast-4a51c',
    storageBucket: 'grofast-4a51c.appspot.com',
    iosBundleId: 'uz.grofast.grofast',
  );
}
