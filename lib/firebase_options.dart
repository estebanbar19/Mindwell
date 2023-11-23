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
    apiKey: 'AIzaSyD945nXQMgLBL4-moW5P__DBtsy90UpqLg',
    appId: '1:854827781022:web:5b2f9c710f5a067bd0e48f',
    messagingSenderId: '854827781022',
    projectId: 'fastfood-4b180',
    authDomain: 'fastfood-4b180.firebaseapp.com',
    databaseURL: 'https://fastfood-4b180-default-rtdb.firebaseio.com',
    storageBucket: 'fastfood-4b180.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4v93s6Bk0JfUG3lYnTZhhLKVUfPUyQgg',
    appId: '1:854827781022:android:5e5d2fa46657a832d0e48f',
    messagingSenderId: '854827781022',
    projectId: 'fastfood-4b180',
    databaseURL: 'https://fastfood-4b180-default-rtdb.firebaseio.com',
    storageBucket: 'fastfood-4b180.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzGELAu5P19T6htWlNV-6tB0u3rUqGK2s',
    appId: '1:854827781022:ios:b19a8ed56bd35c44d0e48f',
    messagingSenderId: '854827781022',
    projectId: 'fastfood-4b180',
    databaseURL: 'https://fastfood-4b180-default-rtdb.firebaseio.com',
    storageBucket: 'fastfood-4b180.appspot.com',
    iosClientId: '854827781022-ns9r2nv4degf7qbgenrog8fs2jdhvuvu.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodfast',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzGELAu5P19T6htWlNV-6tB0u3rUqGK2s',
    appId: '1:854827781022:ios:b19a8ed56bd35c44d0e48f',
    messagingSenderId: '854827781022',
    projectId: 'fastfood-4b180',
    databaseURL: 'https://fastfood-4b180-default-rtdb.firebaseio.com',
    storageBucket: 'fastfood-4b180.appspot.com',
    iosClientId: '854827781022-ns9r2nv4degf7qbgenrog8fs2jdhvuvu.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodfast',
  );
}
