import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/routing/app_router.dart';
import 'package:food/core/routing/routes.dart';
import 'package:food/core/theme/app_theme.dart';
import 'package:food/features/home/ui/home_screen.dart';

void main() {
  runApp(FoodApp(appRouter: AppRouter()));
}

class FoodApp extends StatelessWidget {
  final AppRouter appRouter;
  const FoodApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
