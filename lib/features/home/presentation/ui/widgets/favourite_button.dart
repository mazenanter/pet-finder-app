import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/features/favourite/data/models/favorite_request_body.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.imageId});
  final String imageId;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteStates>(
      listenWhen: (previous, current) =>
          current is AddBreedToFavoriteSuccess ||
          current is AddBreedToFavoriteFailure ||
          current is AddBreedToFavoriteLoading,
      listener: (context, state) {
        if (state is AddBreedToFavoriteSuccess) {
          log('Added');
          setState(() {
            isFavorite = true;
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          context.read<FavoriteCubit>().addBreedToFavorite(
            FavoriteRequestBody(imageId: widget.imageId, subId: 'my-user-1234'),
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
      ),
    );
  }
}
