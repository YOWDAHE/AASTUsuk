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
    apiKey: 'AIzaSyC56G80lPlX1yzsqvN2K2W3UCueK2Ulbnc',
    appId: '1:1020186347835:web:3782afa8599c43d8ec8f1e',
    messagingSenderId: '1020186347835',
    projectId: 'aastusuk',
    authDomain: 'aastusuk.firebaseapp.com',
    storageBucket: 'aastusuk.appspot.com',
    measurementId: 'G-1CVX7ML2YE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvmc9loROc9ebEY6YLPjbfF7FyJ6Fuivc',
    appId: '1:1020186347835:android:c4aae24def3cc1bcec8f1e',
    messagingSenderId: '1020186347835',
    projectId: 'aastusuk',
    storageBucket: 'aastusuk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA2hSPuQy0ajWYikUs6bjiWwh9tdsWA-8',
    appId: '1:1020186347835:ios:d26fa2c5781adef5ec8f1e',
    messagingSenderId: '1020186347835',
    projectId: 'aastusuk',
    storageBucket: 'aastusuk.appspot.com',
    iosBundleId: 'com.example.aastuSuk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCA2hSPuQy0ajWYikUs6bjiWwh9tdsWA-8',
    appId: '1:1020186347835:ios:d26fa2c5781adef5ec8f1e',
    messagingSenderId: '1020186347835',
    projectId: 'aastusuk',
    storageBucket: 'aastusuk.appspot.com',
    iosBundleId: 'com.example.aastuSuk',
  );
}
