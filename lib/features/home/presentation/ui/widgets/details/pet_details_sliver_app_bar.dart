import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/extension.dart';
import 'package:pet_finder_app/core/themes/colors_manager.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/details/detials_favorite_button.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/favourite_button.dart';

class PetDetailsSliverAppBar extends StatelessWidget {
  final PetModel pet;

  const PetDetailsSliverAppBar({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350.h,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 14.w),
        child: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
            color: ColorsManager.primaryColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: const DetailsFavoriteButton(),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'pet_${pet.name}',
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffC5E8E7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),

            child: Center(
              child: Icon(
                Icons.pets,
                size: 150.sp,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
