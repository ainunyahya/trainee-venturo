import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/modules/features/detail_promo/views/components/content.dart';

import '../../../list/views/components/promo_card.dart';
import '../components/header_section.dart';

class DetailMenuView extends StatelessWidget {


  const DetailMenuView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arg = Get.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const HeaderSection(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(arg['promoName']),
                  // Image.network(arg['thumbnailUrl']),
                  const SizedBox(height: 20),
                  PromoCard(
                  enableShadow: true,
                  promoName: arg['promoName'],
                  discountNominal: arg['discountNominal'],
                  thumbnailUrl: arg['thumbnailUrl'],
                  width: double.infinity,
                  onTap: null, // onTap di-nonaktifkan
                  ),
                  const SizedBox(height: 36),
                  // Text(
                  //   arg['promoName'],
                  //   style: const TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const SizedBox(height: 8),
                  // Text(
                  //   "Discount: ${arg['discountNominal']}%",
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // const Text(
                  //   'Here you can add more details about the promotion.',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                ],
              ),
            ),
            const Expanded(
              child: Content(),
            ),
          ],
        ),
      ),
    );
  }
}