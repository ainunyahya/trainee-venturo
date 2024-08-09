import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/views/components/content_detail_menu.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/views/components/header_detail_menu.dart';

class DetailMenu extends StatelessWidget {
  const DetailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> menu = Get.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: const HeaderDetailMenu(),
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 36,),
            Center(
              child: Container(
                height: 181,
                width: 234,
                margin: EdgeInsets.only(right: 12.r),
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white,
                ),
                child: Image.network(
                  menu['foto'] ?? 'https://via.placeholder.com/150',
                  fit: BoxFit.contain,
                ),
              ),
            ), // Placeholder jika foto null
            const SizedBox(height: 36),
            const Expanded(
              child: ContentDetailMenu()
            ),
          ],
        ),
      ),
    );
  }
}
