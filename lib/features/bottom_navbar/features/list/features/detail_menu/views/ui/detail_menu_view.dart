import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/controllers/detail_menu_controller.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/views/components/qty_button_component.dart';
import 'package:trainee/shared/customs/custom_app_bar.dart';
import 'package:trainee/shared/customs/custom_primary_button.dart';
import 'package:trainee/shared/styles/google_text_style.dart';

class DetailMenu extends StatelessWidget {
  DetailMenu({super.key});

  // call controller
  final DetailMenuController controller = DetailMenuController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        appBar: const CustomAppBar(
          title: "Detail Menu",
          image: null,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : BuildBody(controller: controller),
        ),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.controller,
  });

  final DetailMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: controller.arg.foto!,
              height: 181,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(25, 46, 25, 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TEXT SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.arg.nama!,
                            style: GoogleTextStyle.fw700.copyWith(
                              fontSize: 20,
                              color: MainColor.primary,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            maxLines: 4,
                            controller.detailMenu.value.data!.menu!.deskripsi!,
                            style: GoogleTextStyle.fw500.copyWith(
                              fontSize: 16,
                              color: MainColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ItemQuantityButtonComponent(controller: controller)
                  ],
                ),
                // PRICE, LEVEL, Toping SECTION
                const SizedBox(height: 25),
                const Divider(
                  color: MainColor.grey,
                  thickness: 1,
                ),
                // create button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.harga,
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Harga",
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 16,
                            color: MainColor.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Rp ${controller.detailMenu.value.data!.menu!.harga!}",
                      style: GoogleTextStyle.fw700.copyWith(
                        fontSize: 18,
                        color: MainColor.primary,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: MainColor.grey,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.level,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Level",
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 16,
                            color: MainColor.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.openLevelBottomSheet();
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.detailMenu.value.data!.level!.isEmpty
                                  ? "-"
                                  : "${controller.detailMenu.value.data!.level![controller.selectedLevel.value].keterangan}",
                              style: GoogleTextStyle.fw600.copyWith(
                                fontSize: 16,
                                color: MainColor.black,
                              ),
                            ),
                          ),
                          if (controller
                              .detailMenu.value.data!.level!.isNotEmpty)
                            const SizedBox(width: 5),
                          if (controller
                              .detailMenu.value.data!.level!.isNotEmpty)
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MainColor.black,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: MainColor.grey,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.topping,
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Topping",
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 16,
                            color: MainColor.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.openToppingBottomSheet();
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.detailMenu.value.data!.topping!.isEmpty
                                  ? "-"
                                  : "${controller.detailMenu.value.data!.topping![controller.selectedTopping.value].keterangan}",
                              style: GoogleTextStyle.fw600.copyWith(
                                fontSize: 16,
                                color: MainColor.black,
                              ),
                            ),
                          ),
                          if (controller
                              .detailMenu.value.data!.topping!.isNotEmpty)
                            const SizedBox(width: 5),
                          if (controller
                              .detailMenu.value.data!.topping!.isNotEmpty)
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: MainColor.black,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: MainColor.grey,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.catatan,
                          width: 20.w,
                          height: 22.h,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Note",
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 16,
                            color: MainColor.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.openNoteBottomSheet();
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.noteController.value.text.isEmpty
                                  ? "...add note"
                                  : controller.noteController.value.text,
                              style: GoogleTextStyle.fw600.copyWith(
                                fontSize: 16,
                                color: MainColor.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: MainColor.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: MainColor.grey,
                  thickness: 1,
                ),
                const SizedBox(height: 40),
                CustomPrimaryButton(
                    text: "Tambahkan ke Pesanan",
                    onTap: () {
                      controller.addToCart(controller.arg);
                      Get.toNamed(MainRoute.checkout);
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
