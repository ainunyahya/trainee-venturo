import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/constants/cores/assets/image_constant.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    this.searchController,
    this.onChange,
  });

  final TextEditingController? searchController;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.r),
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
      child: TextField(
        controller: searchController,
        style: Get.textTheme.labelSmall?.copyWith(
          fontSize: 18.sp,
          letterSpacing: 0,
        ),
        maxLines: 1,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          isDense: true,
          prefixIcon: Image.asset(
            ImageConstant.pencarian,
            height: 14.h,
            width: 14.w,
          ),
          prefixIconColor: Theme.of(context).primaryColor,
          hintText: 'Pencarian'.tr,
          hintStyle: Get.textTheme.labelSmall?.copyWith(
            color: Colors.grey[500],
            fontSize: 14.sp,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
