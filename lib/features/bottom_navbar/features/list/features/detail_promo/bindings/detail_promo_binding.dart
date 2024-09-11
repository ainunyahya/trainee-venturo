import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_promo/controllers/detail_promo_controller.dart';

class DetailPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailPromoController());
  }
}