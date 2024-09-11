import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}