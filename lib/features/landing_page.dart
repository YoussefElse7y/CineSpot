import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (user) {
            Navigator.pushReplacementNamed(context, Routes.mainScreen);
          },
          unauthenticated: () {
            Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
          },
          orElse: () {
          },
        );
      },
      child: Scaffold(
        backgroundColor: ThemeConstants.backgroundDark,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/grid_image.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
