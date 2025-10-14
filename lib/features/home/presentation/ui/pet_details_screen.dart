import 'package:flutter/material.dart';
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
          CustomScrollView(slivers: [PetDetailsSliverAppBar(pet: pet)]),
        ],
      ),
    );
  }
}
