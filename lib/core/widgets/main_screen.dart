import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/favorite_screen.dart';
import 'package:pet_finder_app/features/home/presentation/ui/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    FavoriteScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
