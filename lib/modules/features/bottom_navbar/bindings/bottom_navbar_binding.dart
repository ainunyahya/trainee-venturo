import 'package:get/get.dart';
import 'package:trainee/modules/features/bottom_navbar/controllers/bottom_navbar_controller.dart';

class BottomNavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavbarController());
  }
}
