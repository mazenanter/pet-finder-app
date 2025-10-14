import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: HugeIcon(
          icon: isFavorite
              ? HugeIcons.strokeRoundedFavourite
              : HugeIcons.strokeRoundedFavourite,
          size: 24.sp,
          color: isFavorite ? Colors.red : const Color(0xff00CEC9),
        ),
      ),
    );
  }
}

class PetModel {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String imageUrl;

  PetModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.imageUrl,
  });
}
