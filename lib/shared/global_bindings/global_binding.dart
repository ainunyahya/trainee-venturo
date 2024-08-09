import 'package:get/get.dart';
import 'package:trainee/shared/global_controllers/global_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
  }
}
