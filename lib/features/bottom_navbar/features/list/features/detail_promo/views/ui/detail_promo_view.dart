import 'package:flutter/material.dart';
import 'package:trainee/configs/themes/main_color.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_promo/controllers/detail_promo_controller.dart';
import 'package:trainee/features/bottom_navbar/features/list/views/components/promo_card.dart';
import 'package:trainee/shared/styles/google_text_style.dart';
import 'package:html/parser.dart';

import '../components/header_section.dart';

class PromoDetailView extends StatelessWidget {

  PromoDetailView({
    super.key,
  });

// call controller
  final DetailPromoController controller = DetailPromoController.to;
  @override
  Widget build(BuildContext context) {

  return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const HeaderSection(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: PromoCard(
                width: double.maxFinite,
                isVoucher: controller.arg.type == "voucher" ? true : false,
                promoName: controller.arg.nama!,
                discountNominal: controller.arg.nominal.toString(),
                thumbnailUrl: controller.arg.foto!,
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
                    const Text(
                      "Nama Promo",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.arg.nama!,
                      style: GoogleTextStyle.fw700.copyWith(
                        fontSize: 20,
                        color: MainColor.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.list_rounded,
                          color: MainColor.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Term & Condition",
                          style: GoogleTextStyle.fw600.copyWith(
                            fontSize: 16,
                            color: MainColor.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // using html parse to render html text
                    Text(
                      parse(controller.arg.syaratKetentuan!).body!.text,
                      style: GoogleTextStyle.fw400.copyWith(
                        fontSize: 14,
                        color: MainColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}