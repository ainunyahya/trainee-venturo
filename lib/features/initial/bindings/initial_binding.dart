import 'package:get/get.dart';
import 'package:trainee/shared/global_controllers/initial_controller.dart';

class GetInitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InitialController());
  }
}
