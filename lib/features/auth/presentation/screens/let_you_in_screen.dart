import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/auth/presentation/widgets/illustration_painter.dart';
import 'package:cine_spot/features/auth/presentation/widgets/social_login_button.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LetYouInScreen extends StatelessWidget {
  const LetYouInScreen({super.key});

@override
Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final l10n = AppLocalizations.of(context)!;
  return Scaffold(
    backgroundColor: isDark
        ? ThemeConstants.backgroundDark
        : ThemeConstants.backgroundLight,
    body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (user) {
            // Check if profile exists after Google sign-in
            context.read<ProfileBloc>().add(
              ProfileEvent.checkProfileExists(user.id),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      },
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, profileState) {
          profileState.maybeWhen(
            notFound: () {
              // No profile, go to fill profile
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.fillProfileScreen,
                (route) => false,
              );
            },
            loaded: (profile) {
              // Profile exists, go to home
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainScreen,
                (route) => false,
              );
            },
            orElse: () {},
          );
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeConstants.spacingL,
              ),
              child: Column(
                // ... rest of your existing Column children
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: ThemeConstants.spacingM),
                const SizedBox(height: ThemeConstants.spacingXL),
                // Illustration
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? const Color(0xFF2A2D36)
                          : const Color(0xFFF5F5F5),
                    ),
                    child: _letYouInVector(isDark),
                  ),
                ),
                const SizedBox(height: ThemeConstants.spacingXL),
                // Title
                Center(
                  child: Text(
                    l10n.lets_you_in,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: ThemeConstants.spacingXL),
                // Social login buttons
                SocialLoginButton(
                  icon: Icons.facebook,
                  label: l10n.continue_with_facebook,
                  onPressed: () {},
                  iconColor: const Color(0xFF1877F2),
                ),
                const SizedBox(height: ThemeConstants.spacingM),
                SocialLoginButton(
                  icon: Icons.g_mobiledata,
                  label: l10n.continue_with_google,
                  onPressed: () {
                        context.read<AuthBloc>().add(const AuthEvent.signInWithGoogle());

                  },
                  iconColor: const Color(0xFF4285F4),
                  customIcon: Image.network(
                    'https://www.google.com/favicon.ico',
                    width: 24,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.g_mobiledata, size: 24),
                  ),
                ),
                const SizedBox(height: ThemeConstants.spacingM),
                SocialLoginButton(
                  icon: Icons.apple,
                  label: l10n.continue_with_apple,
                  onPressed: () {},
                  iconColor: isDark ? Colors.white : Colors.black,
                ),
                const SizedBox(height: ThemeConstants.spacingL),
                // Divider
                _divider(isDark),
                const SizedBox(height: ThemeConstants.spacingL),
                // Sign in with password button
                _signInWithPassword(context),
                const SizedBox(height: ThemeConstants.spacingL),
                // Sign up link
                _signUp(isDark, context),
                const SizedBox(height: ThemeConstants.spacingL),
              ],
            ),
          ),
        ),
      ),
      )
    )
    );
  }

  Center _signUp(bool isDark, BuildContext context) {
    return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                    Navigator.pushNamed(context, Routes.signUpScreen);

                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: ThemeConstants.primaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }

  SizedBox _signInWithPassword(BuildContext context) {
    return SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signInScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeConstants.primaryLight,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ThemeConstants.radiusXL,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign in with password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
  }

  Row _divider(bool isDark) {
    return Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: isDark ? Colors.grey[700] : Colors.grey[300],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ThemeConstants.spacingM,
                    ),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: isDark ? Colors.grey[700] : Colors.grey[300],
                    ),
                  ),
                ],
              );
  }

  Stack _letYouInVector(bool isDark) {
    return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Building window
                      Positioned(
                        top: 60,
                        right: 60,
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF3A3D46)
                                : const Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GridView.count(
                            crossAxisCount: 3,
                            padding: const EdgeInsets.all(8),
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            children: List.generate(
                              9,
                              (index) => Container(
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF2A2D36)
                                      : const Color(0xFFD0D0D0),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Person and tree illustration
                      Positioned(
                        bottom: 40,
                        child: SizedBox(
                          width: 200,
                          height: 160,
                          child: CustomPaint(
                            painter: IllustrationPainter(isDark: isDark),
                          ),
                        ),
                      ),
                    ],
                  );
  }
}

