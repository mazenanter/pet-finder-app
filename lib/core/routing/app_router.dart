import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/features/onboarding/presentation/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
