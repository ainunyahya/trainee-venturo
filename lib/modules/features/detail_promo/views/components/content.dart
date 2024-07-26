import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Content extends StatelessWidget implements PreferredSizeWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arg = Get.arguments;
    
    return Container(
      // alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(111, 24, 24, 24),
            blurRadius: 15,
            spreadRadius: -1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    arg['promoName'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Discount: ${arg['discountNominal']}%",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Berhasil mereferensikan rekan/teman untuk menjadi karyawan"),
          const SizedBox(height: 16),
          const Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea vommodo consequat.")
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}