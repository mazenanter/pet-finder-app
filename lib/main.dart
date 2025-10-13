import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/routing/app_router.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(PetFinderApp(appRouter: AppRouter()));
}
