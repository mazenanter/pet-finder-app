import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_category_list.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_header.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_pets_grid.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteHeader(),
          verticalSpace(20),
          const FavoriteCategoriesList(),
          verticalSpace(22),
          Expanded(child: FavoritePetsGrid()),
        ],
      ),
    );
  }
}
