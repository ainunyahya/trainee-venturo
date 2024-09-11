import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/checkout/controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
  }
}