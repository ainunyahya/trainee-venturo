import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/initial/views/ui/get_location_screen.dart';
import 'package:trainee/utils/services/location_service.dart';
import 'package:trainee/utils/services/hive_service.dart';

class InitialController extends GetxController {
  RxString statusLocation = RxString('loading');
  RxString messageLocation = RxString('');
  Rxn<Position> position = Rxn<Position>();
  RxnString address = RxnString();

  RxString id = RxString('');
  RxString name = RxString('');
  RxString photo = RxString('');

  Future<void> getLocation() async {
    if (Get.isDialogOpen != true) {
      Get.dialog(const GetLocationScreen(), barrierDismissible: false);
    }

    // Meminta izin lokasi
    var status = await Permission.locationWhenInUse.status;
    if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
    }

    if (status.isGranted) {
      try {
        statusLocation.value = 'loading';
        final locationResult = await LocationServices.getCurrentPosition();

        if (locationResult.success) {
          position.value = locationResult.position;
          address.value = locationResult.address;
          statusLocation.value = 'success';

          await Future.delayed(const Duration(seconds: 2));
          Get.until((route) => route.settings.name == MainRoute.list);
        } else {
          statusLocation.value = 'error';
          messageLocation.value = locationResult.message!;
        }
      } catch (e) {
        statusLocation.value = 'error';
        messageLocation.value = 'Server error'.tr;
      }
    } else {
      statusLocation.value = 'error';
      messageLocation.value = 'Permission denied'.tr;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getLocation();
    LocationServices.streamService.listen((status) => getLocation());

    id.value = HiveService.get("id") ?? ''; 
    name.value = HiveService.get("name") ?? ''; 
    photo.value = HiveService.get("photo") ?? ''; 
  }
}
