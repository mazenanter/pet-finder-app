import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/attribute_card.dart';

class PetAttributesSection extends StatelessWidget {
  final BreedEntity pet;

  const PetAttributesSection({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: AttributeCard(label: 'Gender', value: pet.origin),
          ),
          horizontalSpace(21),
          Expanded(
            child: AttributeCard(label: 'Age', value: pet.age),
          ),
          horizontalSpace(21),
          Expanded(
            child: AttributeCard(label: 'Weight', value: 500.w.toString()),
          ),
        ],
      ),
    );
  }
}
