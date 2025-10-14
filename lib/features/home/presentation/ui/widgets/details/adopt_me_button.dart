import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/widgets/app_text_button.dart';

import '../../../../../../core/themes/text_styles_manager.dart';

class AdoptMeButton extends StatelessWidget {
  const AdoptMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: AppTextButton(
        text: 'Adopt me',
        onPressed: () {},
        textStyle: TextStylesManager.font18Medium,
      ),
    );
  }
}
