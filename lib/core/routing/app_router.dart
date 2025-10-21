import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/auth/presentation/screens/let_you_in_screen.dart';
import 'package:cine_spot/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:cine_spot/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:cine_spot/features/home/presentation/screens/home_screen.dart';
import 'package:cine_spot/features/home/presentation/screens/main_screen.dart';
import 'package:cine_spot/features/home/presentation/screens/details_screen.dart';
import 'package:cine_spot/features/landing_page.dart';
import 'package:cine_spot/features/on_boarding_screen.dart';
import 'package:cine_spot/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cine_spot/features/profile/presentation/screens/fill_profile_screen.dart';
import 'package:cine_spot/features/profile/presentation/screens/language_selection_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landingScreen:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.letYouInScreen:
        return MaterialPageRoute(builder: (_) => const LetYouInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.fillProfileScreen:
        return MaterialPageRoute(builder: (_) => const FillProfileScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.detailsScreen:
        Map<String,dynamic> data = settings.arguments as Map<String,dynamic>;
        List<MovieItem> movies = data['movies'] as List<MovieItem>;
       String title = data['title'] as String;
        return MaterialPageRoute(builder: (_) => DetailsScreen(movies: movies,pageTitle: title,));
      case Routes.editProfileScreen:
  return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  case Routes.languageScreen:
  return MaterialPageRoute(builder: (_) => const LanguageScreen());
      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
