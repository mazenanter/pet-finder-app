import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Find Your Forever Pet', style: TextStylesManager.font24Bold),
          IconButton(
            onPressed: () {},
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              size: 24.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
