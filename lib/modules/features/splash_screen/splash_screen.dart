import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(MainRoute.counter); // Navigate to CounterView
    });

    return Scaffold(
      backgroundColor: MainColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/java_code.png'), // Your splash image
            const SizedBox(height: 20),
            // const CircularProgressIndicator(), // Optional loading indicator
          ],
        ),
      ),
    );
  }
}
