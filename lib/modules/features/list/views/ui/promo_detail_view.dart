import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoDetailView extends StatelessWidget {


  const PromoDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arg = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg['promoName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(arg['thumbnailUrl']),
            const SizedBox(height: 16),
            Text(
              arg['promoName'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Discount: ${arg['discountNominal']}%",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Here you can add more details about the promotion.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
