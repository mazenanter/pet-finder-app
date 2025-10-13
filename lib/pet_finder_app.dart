import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key});
  //final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet Finder App',
        theme: ThemeData(
          //   primaryColor: ColorsManager.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        // initialRoute: Routes.onBoardingScreen,
        // onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
