import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee/configs/themes/main_color.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: MainColor.primary,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(
      MainColor.primary.value,
      {
        50: MainColor.primary.withOpacity(0.1),
        100: MainColor.primary.withOpacity(0.2),
        200: MainColor.primary.withOpacity(0.3),
        300: MainColor.primary.withOpacity(0.4),
        400: MainColor.primary.withOpacity(0.5),
        500: MainColor.primary.withOpacity(0.6),
        600: MainColor.primary.withOpacity(0.7),
        700: MainColor.primary.withOpacity(0.8),
        800: MainColor.primary.withOpacity(0.9),
        900: MainColor.primary.withOpacity(1.0),
      },
    ),
    accentColor: MainColor.primary,
    cardColor: MainColor.white,
    errorColor: MainColor.danger,
  ),
  iconTheme: IconThemeData(
    color: MainColor.primary,
    size: 24.sp,
  ),
);
