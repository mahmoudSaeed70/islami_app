import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initState() {
    Timer(Duration(seconds: 5), moveToHomeScreen);
  }

  moveToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Image.asset(
        provider.theme == ThemeMode.light
            ? "assets/images/splash_screen.png"
            : "assets/images/splash_screen_dark.png",
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
