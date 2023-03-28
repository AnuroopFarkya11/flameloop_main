import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/enum/phone_auth_user_state.dart';
import '../../services/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => (FirebaseAuth.instance.currentUser == null)
          ? Get.toNamed(RoutePaths.getStarted)
          : UserStore.to.profile.userState == AuthUserState.existingUser
              ? Get.toNamed(RoutePaths.recentChatScreen)
              : Get.toNamed(RoutePaths.setUpProfile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Image.asset(
          'assets/splashscreen/flamelooplogo.png',
        ),
      ),
    );
  }
}
