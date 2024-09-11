import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/order/controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
