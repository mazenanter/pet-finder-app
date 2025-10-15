import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePetImage extends StatelessWidget {
  final String imageUrl;
  final String petName;
  const FavoritePetImage({
    super.key,
    required this.imageUrl,
    required this.petName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: const Color(0xffC5E8E7),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8.r),
          child: Hero(
            tag: 'pet_$petName',
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 140.h,
              width: 151.w,
            ),
          ),
        ),
      ),
    );
  }
}
