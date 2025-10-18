import 'package:flutter/material.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/about_section.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/details_pet_info.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/pet_attribute_section.dart';

import '../../../../../../core/helpers/spacing.dart';

class PetDetailsContent extends StatelessWidget {
  final BreedEntity pet;

  const PetDetailsContent({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(18),
        DetailsPetInfo(pet: pet),
        verticalSpace(20),
        PetAttributesSection(pet: pet),
        verticalSpace(21),
        AboutSection(
          about:
              '${pet.name} is a friendly and playful pet looking for a loving home. They enjoy long walks and cuddles. If you are looking for a loyal companion, ${pet.name} is the perfect choice!',
        ),
        verticalSpace(100),
      ],
    );
  }
}
