import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/helpers/extension.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/core/themes/text_styles_manager.dart';
import 'package:pet_finder_app/core/widgets/app_text_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44.w),
      child: AppTextButton(
        onPressed: () {
          context.pushNamedAndRemoveUntil(Routes.homeScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.w,
          children: [
            SvgPicture.asset('assets/svgs/ic_outline-pets.svg'),
            Text('Get Started', style: TextStylesManager.font18Medium),
          ],
        ),
      ),
    );
  }
}
