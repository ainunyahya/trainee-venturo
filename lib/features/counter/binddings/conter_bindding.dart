import 'package:get/get.dart';
import 'package:trainee/features/counter/controllers/conter_controller.dart';

class ConterBindding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConterController());
  }
}
