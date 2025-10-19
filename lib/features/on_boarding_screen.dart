import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlixauraApp());
}

class FlixauraApp extends StatelessWidget {
  const FlixauraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flixaura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.backgroundDark,
      body: Stack(
        children: [
          // Background Movie Grid Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/grid_image.png', // Your image path
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay (transparency at bottom)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.8),
                    const Color(0xFF000000),
                  ],
                  stops: const [0.0, 0.5, 0.7, 0.9],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CINESPOT',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 2,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No matter what your mood or preference, CineSpot has the perfect movie or show to match.',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white.withOpacity(0.7),
                          height: 1.5,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Get Started Button
                      Container(
                        width: double.infinity,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              ThemeConstants.primaryDark,
                              ThemeConstants.errorLight,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ThemeConstants.primaryLight.withOpacity(
                                0.4,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, Routes.letYouInScreen);
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
