import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';
import 'package:trainee/modules/global_controllers/global_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check connection when the SplashScreen is built
    Future.delayed(const Duration(seconds: 3), () async {
      await GlobalController.to.checkConnection();
      if (GlobalController.to.isConnect.value) {
        Get.offNamed(MainRoute.signIn); // Navigate to CounterView if connected
      } else {
        Get.offNamed(MainRoute.noConnection); // Navigate to NoConnectionView if not connected
      }
    });

    return Scaffold(
      backgroundColor: MainColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstant.logo,
            ), // Your splash image
            const SizedBox(height: 20),
            // const CircularProgressIndicator(), // Optional loading indicator
          ],
        ),
      ),
    );
  }
}
