import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetImage extends StatelessWidget {
  final String imageUrl;

  const PetImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112.w,
      height: 112.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Icon(Icons.pets, size: 40.sp, color: Colors.grey[300]),
      ),
    );
  }
}
