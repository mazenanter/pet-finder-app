import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/sequential_loading.dart';

class PetImage extends StatelessWidget {
  final String imageUrl;

  const PetImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 112.w,
        height: 112.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(child: SequentialLoading()),
        errorWidget: (context, url, error) => const Icon(Icons.pets),
      ),
    );
  }
}
