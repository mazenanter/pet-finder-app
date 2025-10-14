import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/favourite_button.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/pet_image.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/pet_info.dart';

class PetCard extends StatelessWidget {
  final PetModel pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          PetImage(imageUrl: pet.imageUrl),
          horizontalSpace(16),
          Expanded(child: PetInfo(pet: pet)),
          FavoriteButton(),
        ],
      ),
    );
  }
}
