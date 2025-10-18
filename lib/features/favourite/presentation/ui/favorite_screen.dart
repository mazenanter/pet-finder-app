import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_category_list.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_header.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_pets_grid.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorites();
  }

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
