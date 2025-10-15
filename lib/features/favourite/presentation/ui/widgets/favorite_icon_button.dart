import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';

import '../../../../../core/themes/colors_manager.dart';

class FavoriteIconButton extends StatelessWidget {
  final bool isFavorite;
  final int favoriteId;
  const FavoriteIconButton({
    super.key,
    this.isFavorite = false,
    required this.favoriteId,
  });

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
        final isFavorite = cubit.favorites.any((fav) => fav.id == favoriteId);
        return GestureDetector(
          onTap: () async {
            if (isFavorite) {
              await cubit.deleteFavorite(favoriteId);
            }
            cubit.getFavorites();
          },
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: ColorsManager.green500,
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedFavourite,
              size: 18.sp,
              color: isFavorite ? const Color(0xff00CEC9) : Colors.grey[300],
            ),
          ),
        );
      },
    );
  }
}
