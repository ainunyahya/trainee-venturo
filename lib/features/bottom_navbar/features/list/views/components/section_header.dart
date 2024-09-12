import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/configs/themes/main_color.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    this.color,
    required this.title,
    this.image,
    this.width,
    this.height
  });


  final String title;
  final Color? color;
  final String? image;
  final double? width;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         image != null 
            ? Image.asset(image!,
            color: MainColor.primary,
            width: width ?? 23.w, 
            height: height ?? 16.h,)
            : const SizedBox.shrink(),
          10.horizontalSpace,
          Text(title,
              style: Get.textTheme.titleMedium?.copyWith(
                color: color,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
