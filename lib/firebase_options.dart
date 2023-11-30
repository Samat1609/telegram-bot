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
    apiKey: 'AIzaSyAFlk3mdfB1rNPDi_pmDp2yKa_6c9YqSf4',
    appId: '1:122833128896:web:81887765e2d9c2f5554c25',
    messagingSenderId: '122833128896',
    projectId: 'damir-chat-b8973',
    authDomain: 'damir-chat-b8973.firebaseapp.com',
    storageBucket: 'damir-chat-b8973.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtQGzpjX0t3LJiiSHAWedI2edmiUJYuEo',
    appId: '1:122833128896:android:a2b830cce41ba486554c25',
    messagingSenderId: '122833128896',
    projectId: 'damir-chat-b8973',
    storageBucket: 'damir-chat-b8973.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZzJLrjJIbunEVn-4hkN7KPq5z4wJLhnA',
    appId: '1:122833128896:ios:691b8bdcd573be43554c25',
    messagingSenderId: '122833128896',
    projectId: 'damir-chat-b8973',
    storageBucket: 'damir-chat-b8973.appspot.com',
    androidClientId: '122833128896-tsk7p770uc66sjhqup6ertgqtv7grdgb.apps.googleusercontent.com',
    iosClientId: '122833128896-jrnfajm1s3hr2ct5bipgsk7lomak4h7f.apps.googleusercontent.com',
    iosBundleId: 'com.example.damir',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZzJLrjJIbunEVn-4hkN7KPq5z4wJLhnA',
    appId: '1:122833128896:ios:a84bfb1e1d6ff791554c25',
    messagingSenderId: '122833128896',
    projectId: 'damir-chat-b8973',
    storageBucket: 'damir-chat-b8973.appspot.com',
    androidClientId: '122833128896-tsk7p770uc66sjhqup6ertgqtv7grdgb.apps.googleusercontent.com',
    iosClientId: '122833128896-3m0bonthovhsr82dg9pjifhrncl3qk4u.apps.googleusercontent.com',
    iosBundleId: 'com.example.damir.RunnerTests',
  );
}
