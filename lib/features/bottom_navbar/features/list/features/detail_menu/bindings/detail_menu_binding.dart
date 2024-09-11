import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/controllers/detail_menu_controller.dart';

class DetailMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailMenuController());
  }
}
