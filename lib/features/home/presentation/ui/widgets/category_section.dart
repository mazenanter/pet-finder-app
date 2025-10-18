import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/category_list.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/themes/text_styles_manager.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text('Categories', style: TextStylesManager.font20Bold),
        ),
        verticalSpace(14),
        const CategoriesList(),
      ],
    );
  }
}
