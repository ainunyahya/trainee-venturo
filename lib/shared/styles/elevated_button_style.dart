import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee/configs/themes/main_color.dart';

class ElevatedButtonStyle {
  static ButtonStyle mainRounded({
    Color? backgroundColor,
    Color? shadowColor,
    double elevation = 4.0,
    }) {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all<Size>(
        const Size(double.infinity, 50),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(144.r),
        ),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(
        backgroundColor ?? MainColor.primary,
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        MainColor.primary,
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 24.w,
        ),
      ),
      elevation: WidgetStateProperty.all<double>(elevation),
      shadowColor: WidgetStateProperty.all<Color>(
        shadowColor ?? Colors.black.withOpacity(0.5),
      ),
    );
  }
}
