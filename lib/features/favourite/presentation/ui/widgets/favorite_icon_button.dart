import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';

import '../../../../../core/themes/colors_manager.dart';

class FavoriteIconButton extends StatefulWidget {
  final bool isFavorite;
  final int favoriteId;
  const FavoriteIconButton({
    super.key,
    this.isFavorite = false,
    required this.favoriteId,
  });

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteStates>(
      listenWhen: (previous, current) =>
          current is DeleteFavoriteSuccess ||
          current is DeleteFavoriteFailure ||
          current is DeleteFavoriteLoading,
      listener: (context, state) {
        if (state is DeleteFavoriteSuccess) {
          setState(() {
            isFavorite = false;
          });
          context.read<FavoriteCubit>().getFavorites();
        }
      },
      child: GestureDetector(
        onTap: () {
          context.read<FavoriteCubit>().deleteFavorite(widget.favoriteId);
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
      ),
    );
  }
}
