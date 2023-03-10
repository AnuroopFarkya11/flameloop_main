import 'dart:async';

import 'package:flameloop/app/layouts/get_started.dart';
import 'package:flameloop/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flameloop/controller/app_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GetStarted())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff05061B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/splashscreen/flamelooplogo.png',
          ),
        ],
      ),
    );
  }
}
