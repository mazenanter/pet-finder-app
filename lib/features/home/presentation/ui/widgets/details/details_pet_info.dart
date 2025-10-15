import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';

import '../../../../../../core/themes/text_styles_manager.dart';

class DetailsPetInfo extends StatelessWidget {
  final BreedEntity pet;
  const DetailsPetInfo({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pet.name, style: TextStylesManager.font28Bold),
                verticalSpace(4),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLocation01,
                      size: 22.sp,
                      color: Colors.red[400],
                    ),
                    horizontalSpace(4),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        pet.temperament,
                        style: TextStylesManager.font14Regular.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('\$400', style: TextStylesManager.font26ExtraBold),
        ],
      ),
    );
  }
}
