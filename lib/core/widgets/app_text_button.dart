import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/themes/colors_manager.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.text,
    this.textStyle,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRaduis,
    this.buttonHeight,
    this.buttonWidth,
    this.backgroundColor,
    required this.onPressed,
    this.child,
  });
  final String? text;
  final TextStyle? textStyle;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRaduis;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? backgroundColor;
  final void Function() onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaduis ?? 30.r),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 54.h),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManager.primaryColor,
        ),
      ),
      onPressed: onPressed,
      child: child ?? Text(text ?? '', style: textStyle),
    );
  }
}
