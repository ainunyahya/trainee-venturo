import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/models/promo_model.dart';


class DetailPromoController extends GetxController {
  static DetailPromoController get to => Get.find<DetailPromoController>();

  final AllPromoAPIModel arg = Get.arguments;
}