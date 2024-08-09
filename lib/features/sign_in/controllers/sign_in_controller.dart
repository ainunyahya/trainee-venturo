import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/constants/cores/api/api_constant.dart';
import 'package:trainee/shared/global_controllers/global_controller.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

import '../../../utils/services/dio_service.dart';
import '../../../utils/services/local_storage_service.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  // Auth
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  /// Form Variable Setting
  var formKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController();
  var emailValue = "".obs;
  var passwordCtrl = TextEditingController();
  var passwordValue = "".obs;
  var isPassword = true.obs;
  var isRememberMe = false.obs;

  /// Form Password Show
  void showPassword() {
    if (isPassword.value == true) {
      isPassword.value = false;
    } else {
      isPassword.value = true;
    }
  }

  /// Form Validate & Submited
  void validateForm(context) async {
    await GlobalController.to.checkConnection();

    var isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid && GlobalController.to.isConnect.value == true) {
      EasyLoading.show(
        status: 'Sedang Diproses...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      // if admin
      if (emailCtrl.text == "admin" && passwordCtrl.text == "admin") {
        Get.offAllNamed(MainRoute.bottomNavBar);
      } else {
        emailAuth(
          email: emailCtrl.text,
          password: passwordCtrl.text,
          context: context,
        ).then((value) => EasyLoading.dismiss());
      }
    } else if (GlobalController.to.isConnect.value == false) {
      Get.toNamed(MainRoute.noConnection);
    }
  }

  Future<void> emailAuth(
      {required String email,
      required String password,
      required context}) async {
    // init dio from HttpService
    Dio dio = DioService.dioCall();
    try {
      final response = await dio.post(ApiConstant.loginAuth, data: {
        email: email,
        password: password,
      });
    //   print("Respons diterima dari server...");
    // print("Status code: ${response.statusCode}");
    // print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        LocalStorageService.signInAuth(email, password, response.data);
        // print("saya ingin print token");
        // print(response.data);
        Get.offAllNamed(MainRoute.getLocationScreen);
      } else {
        PanaraInfoDialog.show(context,
            title: "Login Gagal",
            message: response.statusCode.toString(),
            buttonText: "Oke", onTapDismiss: () {
          Get.back();
        },
            panaraDialogType: PanaraDialogType.warning,
            barrierDismissible: false);
      }
    } catch (e) {
      // delete session
      LocalStorageService.deleteAuth();
      PanaraInfoDialog.show(context,
          title: "Login Gagal",
          message: e.toString(),
          buttonText: "Oke", onTapDismiss: () {
        Get.back();
      }, panaraDialogType: PanaraDialogType.warning, barrierDismissible: false);
      EasyLoading.dismiss();
    }
  }

  // gmail firebase
  Future<UserCredential?> gmailFirebaseAuth(context) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final cred = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(cred);
      LocalStorageService.signInGmailAuth(userCredential);
      Get.offAllNamed(MainRoute.bottomNavBar);
      return userCredential;
    } catch (e) {
      LocalStorageService.deleteAuth();
      PanaraInfoDialog.show(context,
          title: "Login Gagal",
          message: e.toString(),
          buttonText: "Oke", onTapDismiss: () {
        Get.back();
      }, panaraDialogType: PanaraDialogType.warning, barrierDismissible: false);
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  /// Flavor setting
  void flavorSeting() async {
    Get.bottomSheet(
      Obx(
        () => Wrap(
          children: [
            Container(
              width: double.infinity.w,
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: MainColor.white,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      // GlobalController.to.isStaging.value = false;
                      // GlobalController.to.baseUrl = ApiConstant.production;
                      Get.offAllNamed(MainRoute.forgotPassword);
                    },
                    title: Text(
                      "Production",
                      style: GoogleTextStyle.fw400.copyWith(
                        color: GlobalController.to.isStaging.value == true
                            ? MainColor.black
                            : MainColor.primary,
                        fontSize: 14.sp,
                      ),
                    ),
                    trailing: GlobalController.to.isStaging.value == true
                        ? null
                        : Icon(
                            Icons.check,
                            color: MainColor.primary,
                            size: 14.sp,
                          ),
                  ),
                  Divider(
                    height: 1.h,
                  ),
                  ListTile(
                    onTap: () {
                      GlobalController.to.isStaging.value = true;
                      GlobalController.to.baseUrl = ApiConstant.staging;
                    },
                    title: Text(
                      "Staging",
                      style: GoogleTextStyle.fw400.copyWith(
                        color: GlobalController.to.isStaging.value == true
                            ? MainColor.primary
                            : MainColor.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    trailing: GlobalController.to.isStaging.value == true
                        ? Icon(
                            Icons.check,
                            color: MainColor.primary,
                            size: 14.sp,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
