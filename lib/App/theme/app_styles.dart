import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static final displayLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40.sp,
  );

  static final headlineLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
  );

  static final titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
  );

  static final titleMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
  );

  static final titleSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
  );

  static final bodyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
  );

  static final bodyMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  );

  static final bodySmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
  );

  static final labelLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
  );
}
