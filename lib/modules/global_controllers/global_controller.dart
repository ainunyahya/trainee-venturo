import 'dart:io';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/modules/loggers/logger.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  /// Check Connection Variable
  var isConnect = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnection();
  }

  /// Check Connection Setting
  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('space.venturo.id');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect.value = true;
        LoggerService.log.i("Connected to the internet");
      } else {
        isConnect.value = false;
        LoggerService.log.w("Not connected to the internet");
      }
    } on SocketException catch (exception, stackTrace) {
      isConnect.value = false;
      LoggerService.log.e("Connection error: $exception");
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

}