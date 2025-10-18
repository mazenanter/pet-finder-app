import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/themes/colors_manager.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart';

class AttributeCard extends StatelessWidget {
  final String label;
  final String value;

  const AttributeCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.green500,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStylesManager.font18Medium.copyWith(
              color: ColorsManager.blackColor,
            ),
          ),
          verticalSpace(4),
          Text(value, style: TextStylesManager.font13Medium, maxLines: 1),
        ],
      ),
    );
  }
}
