import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';
import 'package:trainee/configs/themes/app_color.dart';
import 'package:trainee/modules/global_controllers/initial_controller.dart';


class GetLocationScreen extends StatelessWidget {
  const GetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async => false,
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
              50.verticalSpacingRadius,
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
              50.verticalSpacingRadius,
              Obx(() {
                final status = InitialController.to.statusLocation.value;
                return Conditional.single(
                  context: context,
                  conditionBuilder: (context) => status == 'error',
                  widgetBuilder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        InitialController.to.messageLocation.value,
                        style: Get.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      ElevatedButton(
                        onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.location),
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
                            SizedBox(width: 16.w),
                            Text(
                              'Open settings'.tr,
                              style: Get.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  fallbackBuilder: (context) => Conditional.single(
                    context: context,
                    conditionBuilder: (context) => status == 'success',
                    widgetBuilder: (context) => Text(
                      InitialController.to.address.value!,
                      style: Get.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    fallbackBuilder: (context) => const CircularProgressIndicator(
                      color: AppColor.kBlueColor,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
