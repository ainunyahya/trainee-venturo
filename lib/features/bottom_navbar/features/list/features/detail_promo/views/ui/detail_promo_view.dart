import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_promo/controllers/detail_promo_controller.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_promo/views/components/content.dart';

import '../../../../views/components/promo_card.dart';
import '../components/header_section.dart';

class PromoDetailView extends StatelessWidget {

  PromoDetailView({
    super.key,
  });

// call controller
  final DetailPromoController controller = Get.put(DetailPromoController());
  @override
  Widget build(BuildContext context) {

  return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const HeaderSection(),
        body: const Column(
          children: [
            Padding(
                padding: EdgeInsets.all(25.0),
                // child: PromoCard(
                //   width: double.maxFinite,
                //   isVoucher: controller.arg.type == "voucher" ? true : false,
                //   promoName: controller.arg.nama!,
                //   discountNominal: controller.arg.nominal.toString(),
                //   thumbnailUrl: controller.arg.foto ??
                //       "https://javacode.landa.id/img/promo/gambar_62661b52223ff.png",
                // ),
              ),
            Expanded(
              child: Content(),
            ),
          ],
        ),
      ),
    );
  }
}