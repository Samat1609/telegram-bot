import 'dart:developer';

import 'package:damir/api/apis.dart';
import 'package:damir/main.dart';
import 'package:damir/pages/auth/login_page.dart';
import 'package:damir/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
  static String route = 'SplashPage';
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      if (Apis.auth.currentUser != null) {
        log('\nUser : ${Apis.auth.currentUser}');

        Navigator.pushReplacementNamed(context, HomePage.route);
      } else {
        Navigator.pushReplacementNamed(context, LoginPage.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: mq.width * 0.12,
            right: mq.width * 0.12,
            top: mq.height * 0.1,
            child: Image.asset(
              'assets/images/message (1).png',
              height: mq.height * 0.4,
            ),
          ),
          Positioned(
            left: mq.width * 0.12,
            right: mq.width * 0.12,
            top: mq.height * 0.8,
            bottom: mq.height * 0.01,
            child: Text(
              'Made in Kyrgyzstan with ❤️',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  letterSpacing: 1.1),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
