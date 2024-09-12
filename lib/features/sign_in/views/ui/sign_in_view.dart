import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/features/sign_in/controllers/sign_in_controller.dart';
import 'package:trainee/features/sign_in/views/components/form_sign_in_component.dart';
import 'package:trainee/shared/styles/google_text_style.dart';
import 'package:trainee/shared/styles/elevated_button_style.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';

import '../../../../configs/routes/main_route.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    /// Google analytics untuk tracking user di setiap halaman
    if (Platform.isAndroid) {
      /// Tracking bawah dia masuk screen sign in di device android
      analytics.setCurrentScreen(
        screenName: 'Sign In Screen',
        screenClassOverride: 'Android',
      );
    } else if (Platform.isIOS) {
      /// Tracking bawah dia masuk screen sign in di device ios
      analytics.setCurrentScreen(
        screenName: 'Sign In Screen',
        screenClassOverride: 'IOS',
      );
    } else if (Platform.isMacOS) {
      /// Tracking bawah dia masuk screen sign in di device macos
      analytics.setCurrentScreen(
        screenName: 'Sign In Screen',
        screenClassOverride: 'MacOS',
      );
    }

    if (kIsWeb) {
      /// Tracking bawah dia masuk screen sign in di device web
      analytics.setCurrentScreen(
        screenName: 'Sign In Screen',
        screenClassOverride: 'Web',
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: null,
        extendBody: false,
        backgroundColor: MainColor.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35.h),
                Center(
                  child: GestureDetector(
                    onDoubleTap: () => SignInController.to.flavorSeting(),
                    child: Image.asset(
                      ImageConstant.logo,
                      fit: BoxFit.contain,
                      height: 91.h,
                      width: 270.w,
                    ),
                  ),
                ),
                SizedBox(height: 121.h),
                Text(
                  'Masuk untuk melanjutkan!',
                  style: GoogleTextStyle.fw600.copyWith(
                    fontSize: 22.sp,
                    color: MainColor.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                const FormSignInComponent(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MainRoute.forgotPassword);
                      },
                      child: const Text(
                        "Lupa password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),                      
                      ),
                    )
                  ]
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  style: ElevatedButtonStyle.mainRounded(
                    shadowColor: Colors.black, 
                    elevation: 10.0, 
                  ),
                  onPressed: () => SignInController.to.validateForm(context),
                  child: Text(
                    "Masuk",
                    style: GoogleTextStyle.fw800.copyWith(
                      fontSize: 14.sp,
                      color: MainColor.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 77.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "atau",
                        style: TextStyle(
                          color: Colors.grey[500]
                        ),
                      )
                    ),
                    Expanded(
                      child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  style: ElevatedButtonStyle.mainRounded(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black, 
                    elevation: 5.0,
                  ),
                  onPressed: () => SignInController.to.gmailFirebaseAuth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        ImageConstant.googleLogo,
                        width: 24.w,
                        height: 22.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Masuk menggunakan ",
                            style: GoogleTextStyle.fw400
                              .copyWith(color: MainColor.black),
                          ),
                          Text(
                            "Google",
                            style: GoogleTextStyle.fw700
                              .copyWith(color: MainColor.black),
                          ),
                          Container(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  style: ElevatedButtonStyle.mainRounded(
                    backgroundColor: Colors.black,
                    shadowColor: Colors.black, 
                    elevation: 5.0,
                  ),
                  onPressed: () => SignInController.to.gmailFirebaseAuth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        ImageConstant.appleLogo,
                        width: 26.w,
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Masuk menggunakan ",
                            style: GoogleTextStyle.fw400
                              .copyWith(color: MainColor.white),
                          ),
                          Text(
                            "Apple",
                            style: GoogleTextStyle.fw700
                              .copyWith(color: MainColor.white),
                          ),
                          Container(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}