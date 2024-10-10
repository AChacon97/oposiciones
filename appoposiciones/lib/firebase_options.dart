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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCH8OgZttk7ZIBowWeZyoHmXJQJ-l3CaPc',
    appId: '1:967522182939:web:fb0d0b27360a1d70a255be',
    messagingSenderId: '967522182939',
    projectId: 'oposiciones-65a05',
    authDomain: 'oposiciones-65a05.firebaseapp.com',
    storageBucket: 'oposiciones-65a05.appspot.com',
    measurementId: 'G-9PQJ09M3V2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABUoP-xHlwI8z-b8F_bEtSf-0rHq1nCWc',
    appId: '1:967522182939:android:87aacae37aeddac3a255be',
    messagingSenderId: '967522182939',
    projectId: 'oposiciones-65a05',
    storageBucket: 'oposiciones-65a05.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmJhSPjx06_Zs_4UfV5dMhXXVZrbMv2mY',
    appId: '1:967522182939:ios:2779280d2c31fa95a255be',
    messagingSenderId: '967522182939',
    projectId: 'oposiciones-65a05',
    storageBucket: 'oposiciones-65a05.appspot.com',
    iosBundleId: 'com.example.appoposiciones',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmJhSPjx06_Zs_4UfV5dMhXXVZrbMv2mY',
    appId: '1:967522182939:ios:2779280d2c31fa95a255be',
    messagingSenderId: '967522182939',
    projectId: 'oposiciones-65a05',
    storageBucket: 'oposiciones-65a05.appspot.com',
    iosBundleId: 'com.example.appoposiciones',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCH8OgZttk7ZIBowWeZyoHmXJQJ-l3CaPc',
    appId: '1:967522182939:web:fbd356b3a268d4e6a255be',
    messagingSenderId: '967522182939',
    projectId: 'oposiciones-65a05',
    authDomain: 'oposiciones-65a05.firebaseapp.com',
    storageBucket: 'oposiciones-65a05.appspot.com',
    measurementId: 'G-LW0Y6SPLG6',
  );

}