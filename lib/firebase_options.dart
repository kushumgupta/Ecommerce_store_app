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
    apiKey: 'AIzaSyCKy-71diZUxI2C_6KUGXKz3JpEMlUTi0I',
    appId: '1:620895919744:web:b88e60e7fd3d9c075d5065',
    messagingSenderId: '620895919744',
    projectId: 'estoreapp-11e89',
    authDomain: 'estoreapp-11e89.firebaseapp.com',
    storageBucket: 'estoreapp-11e89.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBV2V11lJxFxEfE8nXvVlxjSlIziadBVS8',
    appId: '1:620895919744:android:cae44be115ec97525d5065',
    messagingSenderId: '620895919744',
    projectId: 'estoreapp-11e89',
    storageBucket: 'estoreapp-11e89.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJ1i--PiYhpvpOj5WdeFAOdAAMgjyWu2M',
    appId: '1:620895919744:ios:72414316805d82495d5065',
    messagingSenderId: '620895919744',
    projectId: 'estoreapp-11e89',
    storageBucket: 'estoreapp-11e89.firebasestorage.app',
    androidClientId: '620895919744-8hvha3it4sou5mkiogbh5qeek8ogvp9r.apps.googleusercontent.com',
    iosClientId: '620895919744-82khvg71iolsura5er1ae7tlc6lvc4ta.apps.googleusercontent.com',
    iosBundleId: 'com.example.eStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKy-71diZUxI2C_6KUGXKz3JpEMlUTi0I',
    appId: '1:620895919744:web:a375d34835ff453a5d5065',
    messagingSenderId: '620895919744',
    projectId: 'estoreapp-11e89',
    authDomain: 'estoreapp-11e89.firebaseapp.com',
    storageBucket: 'estoreapp-11e89.firebasestorage.app',
  );

}