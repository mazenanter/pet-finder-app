import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/favorite_pet_card.dart';

import '../../../../home/presentation/ui/widgets/favourite_button.dart';

class FavoritePetsGrid extends StatelessWidget {
  const FavoritePetsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritePets = [
      PetModel(
        gender: 'male',
        age: '19',
        name: 'Joli',
        distance: '1.6 km away',
        imageUrl: 'assets/images/cat.png',
      ),
      PetModel(
        gender: 'male',
        age: '19',
        name: 'Joli',
        distance: '1.6 km away',
        imageUrl: 'assets/images/cat.png',
      ),
    ];

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
        return FavoritePetCard(pet: favoritePets[index]);
      },
    );
  }
}
