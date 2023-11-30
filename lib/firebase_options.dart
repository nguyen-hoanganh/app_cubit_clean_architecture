// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyAhoO1o3KOoCS0c3G8eEum_2akpGGtf0Qs',
    appId: '1:190415831776:web:c02708adf4ad6b8d8cc685',
    messagingSenderId: '190415831776',
    projectId: 'education-app-ccd05',
    authDomain: 'education-app-ccd05.firebaseapp.com',
    storageBucket: 'education-app-ccd05.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUwksB7WgUTxErQ7cfBvOPHNEjL7W5IMI',
    appId: '1:190415831776:android:6933c61da6b47b418cc685',
    messagingSenderId: '190415831776',
    projectId: 'education-app-ccd05',
    storageBucket: 'education-app-ccd05.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPUQzl1xAEeCFQxYx-ppVZP8-Bre4VEj0',
    appId: '1:190415831776:ios:9968b635086053138cc685',
    messagingSenderId: '190415831776',
    projectId: 'education-app-ccd05',
    storageBucket: 'education-app-ccd05.appspot.com',
    iosBundleId: 'com.example.appCubitCleanArchitecture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPUQzl1xAEeCFQxYx-ppVZP8-Bre4VEj0',
    appId: '1:190415831776:ios:9968b635086053138cc685',
    messagingSenderId: '190415831776',
    projectId: 'education-app-ccd05',
    storageBucket: 'education-app-ccd05.appspot.com',
    iosBundleId: 'com.example.appCubitCleanArchitecture',
  );
}
