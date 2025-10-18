import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class DetailsFavoriteButton extends StatefulWidget {
  const DetailsFavoriteButton({super.key});

  @override
  State<DetailsFavoriteButton> createState() => _DetailsFavoriteButtonState();
}

class _DetailsFavoriteButtonState extends State<DetailsFavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: HugeIcon(
        icon: isFavorite
            ? HugeIcons.strokeRoundedFavourite
            : HugeIcons.strokeRoundedFavourite,
        size: 22.sp,
        color: isFavorite ? Colors.red : const Color(0xff00CEC9),
      ),
    );
  }
}
