import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_dressing_user_app/screens/login-screen.dart';
import 'package:smart_dressing_user_app/utilities/constants.dart';

class MySplashScreen extends StatefulWidget {
  static final String id = 'MySplashScreen';
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  getProducts() async {}
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LogInScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(kBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
