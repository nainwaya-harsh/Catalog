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
    apiKey: 'AIzaSyDZgE58D1j_Mfh4S7zGYIxd9rG1k9RZ_-o',
    appId: '1:766039680877:web:764d9aad505d535366dc64',
    messagingSenderId: '766039680877',
    projectId: 'flutterlogin-31e0a',
    authDomain: 'flutterlogin-31e0a.firebaseapp.com',
    storageBucket: 'flutterlogin-31e0a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTyMvxJSE7bpM3FLl4JLhSQIFFH1CwakA',
    appId: '1:766039680877:android:99b9ede5464621b566dc64',
    messagingSenderId: '766039680877',
    projectId: 'flutterlogin-31e0a',
    storageBucket: 'flutterlogin-31e0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVSJgG_c_inK8ayhyt5gLYHGh5U1xETwQ',
    appId: '1:766039680877:ios:f038337337d31be666dc64',
    messagingSenderId: '766039680877',
    projectId: 'flutterlogin-31e0a',
    storageBucket: 'flutterlogin-31e0a.appspot.com',
    iosClientId: '766039680877-5llmhi5rga9tmsvth7d6jv4l4fgg9kji.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVSJgG_c_inK8ayhyt5gLYHGh5U1xETwQ',
    appId: '1:766039680877:ios:f038337337d31be666dc64',
    messagingSenderId: '766039680877',
    projectId: 'flutterlogin-31e0a',
    storageBucket: 'flutterlogin-31e0a.appspot.com',
    iosClientId: '766039680877-5llmhi5rga9tmsvth7d6jv4l4fgg9kji.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication',
  );
}
