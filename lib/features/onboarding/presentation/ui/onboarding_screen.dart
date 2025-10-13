import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/features/onboarding/presentation/ui/widgets/get_started_button.dart';
import 'package:pet_finder_app/features/onboarding/presentation/ui/widgets/logo_and_title.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [LogoAndTitle(), verticalSpace(61), GetStartedButton()],
        ),
      ),
    );
  }
}
