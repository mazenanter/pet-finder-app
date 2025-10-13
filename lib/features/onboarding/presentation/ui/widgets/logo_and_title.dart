import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart'
    show TextStylesManager;

import '../../../../../core/helpers/spacing.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/dog_and_cat.png'),
        verticalSpace(69),
        Text(
          'Find Your Best\nCompanion With Us',
          textAlign: TextAlign.center,
          style: TextStylesManager.font32Bold,
        ),
        verticalSpace(10),
        Text(
          'Join & discover the best suitable pets as\nper your preferences in your location',
          style: TextStylesManager.font16Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
