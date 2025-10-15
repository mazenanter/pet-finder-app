import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_cubit.dart';
import 'package:pet_finder_app/features/favourite/presentation/controller/favorite_states.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_pet_card.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/sequential_loading.dart';

class FavoritePetsGrid extends StatelessWidget {
  const FavoritePetsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      buildWhen: (previous, current) =>
          current is GetFavoritesSuccess ||
          current is GetFavoritesError ||
          current is GetFavoritesLoading,
      builder: (context, state) {
        switch (state) {
          case GetFavoritesLoading _:
            return Center(child: SequentialLoading());
          case GetFavoritesError _:
            return Center(child: Text(state.message));
          case GetFavoritesSuccess _:
            final favoritePets = (state).favorites;
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.73.w,
              ),
              itemCount: favoritePets.length,
              itemBuilder: (context, index) {
                return FavoritePetCard(favoriteModel: favoritePets[index]);
              },
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
