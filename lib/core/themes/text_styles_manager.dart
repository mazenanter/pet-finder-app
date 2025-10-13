import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/themes/colors_manager.dart';

class TextStylesManager {
  static TextStyle font32Bold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.blackColor,
  );
  static TextStyle font16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.greyColor,
  );
  static TextStyle font18Medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
