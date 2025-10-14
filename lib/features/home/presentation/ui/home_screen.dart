import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/category_section.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/custom_search_bar.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/home_header.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/pets_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            verticalSpace(20),
            const CustomSearchBar(),
            verticalSpace(20),
            const CategoriesSection(),
            verticalSpace(23),
            Expanded(child: PetsList()),
          ],
        ),
      ),
    );
  }
}
