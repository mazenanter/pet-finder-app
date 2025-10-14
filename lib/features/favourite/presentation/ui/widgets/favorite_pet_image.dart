import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePetImage extends StatelessWidget {
  final String imageUrl;

  const FavoritePetImage({super.key, required this.imageUrl});

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
        child: Center(
          child: Icon(
            Icons.pets,
            size: 60.sp,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
