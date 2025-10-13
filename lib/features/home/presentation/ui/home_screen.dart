import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const HomeHeader(), verticalSpace(20)],
        ),
      ),
    );
  }
}
