import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoundedAppBar(
      {super.key,
      required this.title,
      this.image,
      this.onBackButtonPressed,
      this.actions,
      this.titleWidget,
      this.enableBackButton = true,
      this.titleStyle,
      this.shadowColor = Colors.black,
      this.elevation = 4.0});

  final String title;
  final String? image;
  final VoidCallback? onBackButtonPressed;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool? enableBackButton;
  final TextStyle? titleStyle;
  final Color shadowColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          image != null
              ? Image.asset(
                  image!,
                  height: 28.h,
                  width: 28.w,
                )
              : 10.horizontalSpaceRadius,
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: titleStyle ?? Get.textTheme.titleMedium,
              ),
              if (titleWidget != null) 10.verticalSpace,
              if (titleWidget != null) titleWidget!,
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      shadowColor: shadowColor,
      elevation: elevation,
      centerTitle: true,
      leading: enableBackButton == true
          ? IconButton(
              splashRadius: 30.r,
              icon: Icon(Icons.chevron_left, color: Colors.black, size: 36.r),
              onPressed:
                  onBackButtonPressed ?? () => Get.back(closeOverlays: true),
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.r),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
