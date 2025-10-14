import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/adopt_me_button.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/pet_details_content.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/pet_details_sliver_app_bar.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/favourite_button.dart';

class PetDetailsScreen extends StatelessWidget {
  final PetModel pet;

  const PetDetailsScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              PetDetailsSliverAppBar(pet: pet),
              SliverToBoxAdapter(child: PetDetailsContent(pet: pet)),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 20.h),
              child: AdoptMeButton(),
            ),
          ),
        ],
      ),
    );
  }
}
