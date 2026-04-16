import 'package:flutter/material.dart';
import 'package:food/features/auth/login/login_screen.dart';
import 'package:food/features/auth/signup/signup_screen.dart';
import 'package:food/features/cart/cart_screen.dart';
import 'package:food/features/food_details/food_details_screen.dart';
import 'package:food/features/home/ui/home_screen.dart';
import 'package:food/features/location_picker/map_screen.dart';
import 'package:food/features/onboarding/ui/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // الـ arguments اللي ممكن نبعتها مع الصفحات (زي الـ MealModel)
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.foodDetailsScreen:
        // هنا بنستلم الأكلة اللي المستخدم اختارها عشان نعرض بياناتها
        return MaterialPageRoute(
          builder: (_) => FoodDetailsScreen()  //(meal: arguments as MealModel),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());

      // صفحة الـ Error لو المستخدم راح لمسار مش موجود
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}