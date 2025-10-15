import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/core/helpers/extension.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/themes/colors_manager.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_model.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_icon_button.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_pet_image.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';

import '../../../../../core/routing/routes.dart';

class FavoritePetCard extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoritePetCard({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final breedEntity = BreedEntity(
          name: favoriteModel.breedDetailsModel!.breeds.first.name,
          imageUrl:
              favoriteModel.breedDetailsModel!.breeds.first.referenceImageId!,
          description:
              favoriteModel.breedDetailsModel!.breeds.first.description,
          temperament:
              favoriteModel.breedDetailsModel!.breeds.first.temperament,
          origin: favoriteModel.breedDetailsModel!.breeds.first.origin,
          countryCode:
              favoriteModel.breedDetailsModel!.breeds.first.countryCode,
          age: favoriteModel.breedDetailsModel!.breeds.first.lifeSpan,
        );
        context.pushNamed(Routes.petDetailsScreen, arguments: breedEntity);
      },
      child: Container(
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
            FavoritePetImage(
              imageUrl: favoriteModel.breedDetailsModel!.url,
              petName: favoriteModel.breedDetailsModel!.breeds.first.name,
            ),

            Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          favoriteModel.breedDetailsModel!.breeds.first.name,
                          style: TextStylesManager.font14SemiBold.copyWith(
                            color: ColorsManager.blackColor,
                            overflow: TextOverflow.ellipsis,
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
                              favoriteModel
                                  .breedDetailsModel!
                                  .breeds
                                  .first
                                  .origin,
                              style: TextStylesManager.font11Regular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FavoriteIconButton(
                    isFavorite: true,
                    favoriteId: favoriteModel.id,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
