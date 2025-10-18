import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';

import '../../../../../core/helpers/spacing.dart';

class PetInfo extends StatelessWidget {
  final BreedEntity breedEntity;

  const PetInfo({super.key, required this.breedEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(breedEntity.name, style: TextStylesManager.font18Bold),
        verticalSpace(4),
        Text(breedEntity.origin, style: TextStylesManager.font14Regular),
        verticalSpace(2),
        Text(breedEntity.age, style: TextStylesManager.font14Regular),
        verticalSpace(9),
        Row(
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedLocation01,
              size: 14.sp,
              color: Colors.red[400],
            ),
            horizontalSpace(4),
            Expanded(
              child: Text(
                breedEntity.temperament,
                maxLines: 1,
                style: TextStylesManager.font14Regular.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
