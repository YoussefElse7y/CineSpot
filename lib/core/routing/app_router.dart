
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/auth/presentation/screens/let_you_in_screen.dart';
import 'package:cine_spot/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:cine_spot/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:cine_spot/features/home/presentation/screens/home_screen.dart';
import 'package:cine_spot/features/on_boarding_screen.dart';
import 'package:cine_spot/features/profile/presentation/screens/fill_profile_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.letYouInScreen:
        return MaterialPageRoute(builder: (_) => const LetYouInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
        case Routes.fillProfileScreen:
  return MaterialPageRoute(builder: (_) => const FillProfileScreen());
case Routes.homeScreen:
  return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            appBar: AppBar(
              title: Text('No Route Found'),
             
            ),
            body: Center(
              child: Text('No route defined for this path'),
            ),
          ),
        );
    }
  }
}
