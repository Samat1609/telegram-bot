import 'dart:developer';
import 'dart:io';

import 'package:damir/api/apis.dart';
import 'package:damir/helper/dialogs.dart';
import 'package:damir/main.dart';
import 'package:damir/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static String route = 'LoginPage';
}

class _LoginPageState extends State<LoginPage> {
  bool _isAnimated = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  _handleGoogleBtnClick() {
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) async {
      Navigator.pop(context);
      if (user != null) {
        log('\nUser : ${user.user}');
        log(
          '\nAdditionalInfo : ${user.additionalUserInfo}',
        );

        if ((await Apis.userExists())) {
          Navigator.pushReplacementNamed(context, HomePage.route);
        } else {
          Apis.createUser().then((value) => {
                Navigator.pushReplacementNamed(context, HomePage.route),
              });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await Apis.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle error : $e');
      Dialogs.showSnackBar(
          context, 'Something went wrong (Check your internet connection!)');
      return null;
    }
    // Trigger the authentication flow
  }

  /// Signs out the user.
  ///
  /// This method signs out the user from Firebase Authentication and Google Sign-In.
  /// It is an asynchronous method, so it returns a Future that completes when the sign-out process is complete.
  /// Usage example: await _signOut();
  Future<void> _signOut() async {
    // Sign out from Firebase Authentication
    await FirebaseAuth.instance.signOut();

    // Sign out from Google Sign-In
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Damir Chat'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.elasticIn,
            duration: Duration(seconds: 2),
            left: mq.width * 0.12,
            right: _isAnimated ? mq.width * 0.12 : -mq.width * 0.8,
            top: mq.height * 0.1,
            child: Image.asset(
              'assets/images/message (1).png',
              height: mq.height * 0.4,
            ),
          ),
          Positioned(
            left: mq.width * 0.12,
            right: mq.width * 0.12,
            top: mq.height * 0.73,
            bottom: mq.height * 0.08,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Color.fromARGB(255, 135, 235, 140)),
              onPressed: () {
                _handleGoogleBtnClick();
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: mq.height * 0.08,
              ),
              label: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Sign in with ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                TextSpan(
                    text: 'Google',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ])),
            ),
          )
        ],
      ),
    );
  }
}
