import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.imageId});
  final String imageId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      buildWhen: (previous, current) =>
          current is GetFavoritesSuccess ||
          current is AddBreedToFavoriteSuccess ||
          current is DeleteFavoriteSuccess ||
          current is ToggleFavoriteUpdated,

      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        final isFavorite = cubit.isFavorite(imageId);
        return GestureDetector(
          onTap: () {
            cubit.toggleFavorite(
              imageId: imageId,
              body: FavoriteRequestBody(
                imageId: imageId,
                subId: 'my-user-1234',
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: HugeIcon(
              icon: isFavorite
                  ? HugeIcons.strokeRoundedFavourite
                  : HugeIcons.strokeRoundedFavourite,
              size: 24.sp,
              color: isFavorite ? Colors.red : const Color(0xff00CEC9),
            ),
          ),
        );
      },
    );
  }
}
