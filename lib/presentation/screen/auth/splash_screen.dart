import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../router/routes.dart';
import 'auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        AuthController controller = Get.find<AuthController>();
        if (controller.isSignedInWithGoogle()) {
          Get.snackbar('Signed In with google!', '..');

          bool isRegistered = await controller.isUserRegistered();
          if (isRegistered) {
            Get.snackbar('Is Registered!', 'User registered');
            // Get.offAllNamed(Routes.homeScreen);
            Get.offAllNamed(Routes.registrationFormScreen);
          } else {
            Get.snackbar('Not Registered!', 'User is not registered');
            Get.offAllNamed(Routes.registrationFormScreen);
          }
        } else {
          Get.snackbar('Not Signed In With Google!', 'Not Signed');
          Get.offAllNamed(Routes.loginScreen);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text('Learning'),
      ),
    );
  }
}
