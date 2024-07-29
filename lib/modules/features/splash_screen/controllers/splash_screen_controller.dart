import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      // cek sesi
      Get.offNamed(MainRoute.list);
      
    });
  }
}