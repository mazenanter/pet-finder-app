import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/favourite_button.dart';

import '../../../../../../core/themes/text_styles_manager.dart';

class DetailsPetInfo extends StatelessWidget {
  final PetModel pet;
  const DetailsPetInfo({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pet.name, style: TextStylesManager.font28Bold),
              verticalSpace(4),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedLocation01,
                    size: 22.sp,
                    color: Colors.red[400],
                  ),
                  horizontalSpace(4),
                  Text(pet.distance, style: TextStylesManager.font14Regular),
                ],
              ),
            ],
          ),
          Text('\$400', style: TextStylesManager.font26ExtraBold),
        ],
      ),
    );
  }
}
