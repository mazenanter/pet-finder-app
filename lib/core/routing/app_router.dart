import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/core/widgets/main_screen.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed_entity.dart';
import 'package:pet_finder_app/features/home/presentation/ui/pet_details_screen.dart';
import 'package:pet_finder_app/features/onboarding/presentation/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.petDetailsScreen:
        final pet = settings.arguments as BreedEntity;
        return MaterialPageRoute(builder: (_) => PetDetailsScreen(pet: pet));
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
