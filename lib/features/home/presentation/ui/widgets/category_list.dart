import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/category_chip.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndex = 0;

  final categories = ['All', 'Cats', 'Dogs', 'Birds', 'Fish', 'Reptiles'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: CategoryChip(
              label: categories[index],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
