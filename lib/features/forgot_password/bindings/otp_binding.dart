import 'package:get/get.dart';
import 'package:trainee/features/forgot_password/controllers/otp_controller.dart';


class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpController());
  }
}
