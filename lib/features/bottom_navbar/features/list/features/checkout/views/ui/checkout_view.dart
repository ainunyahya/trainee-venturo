import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/checkout/views/components/title_option.dart';

import '../../../../views/components/section_header.dart';
import '../../controllers/checkout_controller.dart';
import '../components/card_order_buttom_bar.dart';
import '../components/rounded_custom_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(
      screenName: 'Checkout Screen',
      screenClassOverride: 'Trainee',
    );

    return Scaffold(
      appBar: const RoundedAppBar(
        title: 'Pesanan',
        image: ImageConstant.pesanan,
      ),
      backgroundColor: MainColor.white,
      body: Obx(() => CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: 28.verticalSpace),
              if (CheckoutController.to.foodItems.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Food',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                // SliverPadding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                //   sliver: CartListSliver(
                //     carts: CheckoutController.to.foodItems,
                //   ),
                // )
              ],
              SliverToBoxAdapter(child: 17.verticalSpace),
              if (CheckoutController.to.drinkItems.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Drink',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                // SliverPadding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                //   sliver: CartListSliver(
                //     carts: CheckoutController.to.drinkItems,
                //   ),
                // )
              ],
            ],
          )),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 25.h, left: 22.w, right: 22.w, bottom: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total order tile
                    TileOption(
                      title: 'Total orders',
                      subtitle: '(${CheckoutController.to.cart.length} Menu):',
                      // icon: Icons.payments_outlined,
                      message:
                          'Rp ${CheckoutController.to.totalPrice.toString()}',
                      titleStyle: Get.textTheme.bodyLarge,
                      messageStyle: Get.textTheme.labelLarge!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Divider(color: Colors.black54, height: 2.h),

                    // Discount tile
                    TileOption(
                      image: ImageConstant.diskon,
                      iconSize: 24.r,
                      title: 'Diskon',
                      message: 'Rp ${CheckoutController.to.discountPrice}',
                      titleStyle: Get.textTheme.bodyLarge,
                      messageStyle: Get.textTheme.labelLarge!
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                    Divider(color: Colors.black54, height: 2.h),

                    // Discount tile
                    TileOption(
                      image: ImageConstant.voucher,
                      iconSize: 24.r,
                      title: 'Voucher',
                      message: 'Rp ${CheckoutController.to.discountPrice}',
                      titleStyle: Get.textTheme.bodyLarge,
                      messageStyle: Get.textTheme.labelLarge!
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                    Divider(color: Colors.black54, height: 2.h),

                    // Payment options tile
                    TileOption(
                      image: ImageConstant.pembayaran,
                      iconSize: 24.r,
                      title: 'Pembayaran',
                      message: 'Pay Later',
                      titleStyle: Get.textTheme.bodyLarge,
                      messageStyle: Get.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              CartOrderBottomBar(
                totalPrice: 'Rp ${CheckoutController.to.grandTotalPrice}',
                onOrderButtonPressed: CheckoutController.to.verify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
