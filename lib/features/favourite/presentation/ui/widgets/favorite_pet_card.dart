import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/themes/colors_manager.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_icon_button.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_pet_image.dart';

import '../../../../home/presentation/ui/widgets/favourite_button.dart';

class FavoritePetCard extends StatelessWidget {
  final PetModel pet;

  const FavoritePetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoritePetImage(imageUrl: pet.imageUrl),

          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                      style: TextStylesManager.font14SemiBold.copyWith(
                        color: ColorsManager.blackColor,
                      ),
                    ),
                    verticalSpace(4),
                    Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedLocation01,

                          size: 14.sp,
                          color: Colors.red[400],
                        ),
                        horizontalSpace(4),
                        Text(
                          pet.distance,
                          style: TextStylesManager.font11Regular,
                        ),
                      ],
                    ),
                  ],
                ),
                const FavoriteIconButton(isFavorite: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
