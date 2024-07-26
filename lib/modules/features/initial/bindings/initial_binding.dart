import 'package:get/get.dart';
import 'package:trainee/modules/global_controllers/initial_controller.dart';

class GetInitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
