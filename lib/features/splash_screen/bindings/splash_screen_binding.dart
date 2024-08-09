import 'package:get/get.dart';
import 'package:trainee/features/splash_screen/controllers/splash_screen_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}