import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/favourite_button.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/pet_card.dart';

class PetsList extends StatelessWidget {
  const PetsList({super.key});

  @override
  Widget build(BuildContext context) {
    final pets = [
      PetModel(
        name: 'Joli',
        gender: 'Female',
        age: '5 Months Old',
        distance: '1.6 km away',
        imageUrl: 'assets/images/pet1.png',
      ),
      PetModel(
        name: 'Tom',
        gender: 'Male',
        age: '1 year Old',
        distance: '2.7 km away',
        imageUrl: 'assets/images/pet2.png',
      ),
      PetModel(
        name: 'Oliver',
        gender: 'Male birdiensis',
        age: '3 Months Old',
        distance: '3 km away',
        imageUrl: 'assets/images/pet3.png',
      ),
      PetModel(
        name: 'Shelly',
        gender: 'Female',
        age: '13 year Old',
        distance: '3 km away',
        imageUrl: 'assets/images/pet4.png',
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: pets.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: PetCard(pet: pets[index]),
        );
      },
    );
  }
}
