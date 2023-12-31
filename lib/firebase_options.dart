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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDi-XQWUpCytfogefEfVW4cyZTOKSWyiSs',
    appId: '1:974040905259:web:273106761100b980b49c6e',
    messagingSenderId: '974040905259',
    projectId: 'turolconnecttfg',
    authDomain: 'turolconnecttfg.firebaseapp.com',
    storageBucket: 'turolconnecttfg.appspot.com',
    measurementId: 'G-K5W0S7D8XT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwbgrApYXkha_tW0k4uI96oyBTS-KwKH0',
    appId: '1:974040905259:android:790ba15e2da42ed3b49c6e',
    messagingSenderId: '974040905259',
    projectId: 'turolconnecttfg',
    storageBucket: 'turolconnecttfg.appspot.com',
  );
}
