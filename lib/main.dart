import 'package:damir/pages/auth/login_page.dart';
import 'package:damir/pages/home_page.dart';
import 'package:damir/pages/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

late Size mq;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => {
            _initializeFirebase(),
            runApp(const MyApp()),
          });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Damir Chat',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 28,
          ),
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 19),
          centerTitle: true,
        ),
      ),
      initialRoute: SplashPage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        LoginPage.route: (context) => LoginPage(),
        SplashPage.route: (context) => SplashPage(),
      },
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
