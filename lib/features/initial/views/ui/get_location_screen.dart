import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';
import 'package:trainee/configs/themes/app_color.dart';
import 'package:trainee/shared/global_controllers/initial_controller.dart';


class GetLocationScreen extends StatelessWidget {
  const GetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.bgBlank),
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                if (InitialController.to.statusLocation.value == 'loading') {
                  return Text(
                    'Mencari lokasimu...',
                    style: Get.textTheme.titleLarge!
                        .copyWith(color: AppColor.kDarkColor.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Text(
                    'Lokasimu',
                    style: Get.textTheme.titleLarge!
                        .copyWith(color: AppColor.kDarkColor.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  );
                }
              }),
              SizedBox(height: 50.h),
              Stack(
                children: [
                  Image.asset(
                    ImageConstant.iconLocation,
                    width: 190.r,
                  ),
                  Padding(
                    padding: EdgeInsets.all(70.r),
                    child: Icon(
                      Icons.location_pin,
                      size: 50.r,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              Obx(() => 
                ConditionalSwitch.single<String>(
                  context: context,
                  valueBuilder: (context) =>
                    InitialController.to.statusLocation.value,
                  caseBuilders: {
                    'error': (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          InitialController.to.messageLocation.value,
                          style: Get.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        24.verticalSpacingRadius,
                        ElevatedButton(
                          onPressed: () =>
                            // AppSettings.openLocationSettings(),
                            AppSettings.openAppSettings(
                              type: AppSettingsType.location),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 2,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.settings,
                                  color: AppColor.kDarkColor,
                                ),
                                16.horizontalSpaceRadius,
                                Text(
                                  'Open settings'.tr,
                                  style: Get.textTheme.bodySmall,
                                ),
                              ],
                            ),
                        ),
                      ],
                    ),
                    'success': (context) => Text(
                      InitialController.to.address.value!,
                      style: Get.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  },
                  fallbackBuilder: (context) => const CircularProgressIndicator(
                    color: AppColor.kBlueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
