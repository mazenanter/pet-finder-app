import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/themes/text_styles_manager.dart';

class AboutSection extends StatelessWidget {
  final String about;

  const AboutSection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About:', style: TextStylesManager.font22SemiBold),
          verticalSpace(7),
          Text(about, style: TextStylesManager.font16Regular),
        ],
      ),
    );
  }
}
