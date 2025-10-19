import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class LetYouInScreen extends StatelessWidget {
  const LetYouInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? ThemeConstants.backgroundDark
          : ThemeConstants.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeConstants.spacingL,
            ),
            child: Column(
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
                    child: Stack(
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
                    ),
                  ),
                ),
                const SizedBox(height: ThemeConstants.spacingXL),
                // Title
                Center(
                  child: Text(
                    "Let's you in",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: ThemeConstants.spacingXL),
                // Social login buttons
                _SocialLoginButton(
                  icon: Icons.facebook,
                  label: 'Continue with Facebook',
                  onPressed: () {},
                  iconColor: const Color(0xFF1877F2),
                ),
                const SizedBox(height: ThemeConstants.spacingM),
                _SocialLoginButton(
                  icon: Icons.g_mobiledata,
                  label: 'Continue with Google',
                  onPressed: () {},
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
                _SocialLoginButton(
                  icon: Icons.apple,
                  label: 'Continue with Apple',
                  onPressed: () {},
                  iconColor: isDark ? Colors.white : Colors.black,
                ),
                const SizedBox(height: ThemeConstants.spacingL),
                // Divider
                Row(
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
                ),
                const SizedBox(height: ThemeConstants.spacingL),
                // Sign in with password button
                SizedBox(
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
                ),
                const SizedBox(height: ThemeConstants.spacingL),
                // Sign up link
                Center(
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
                ),
                const SizedBox(height: ThemeConstants.spacingL),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color iconColor;
  final Widget? customIcon;

  const _SocialLoginButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.iconColor,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isDark ? const Color(0xFF1F222B) : Colors.white,
          side: BorderSide(
            color: isDark ? const Color(0xFF35383F) : const Color(0xFFE0E0E0),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusL),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customIcon ?? Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: ThemeConstants.spacingM),
            Text(
              label,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IllustrationPainter extends CustomPainter {
  final bool isDark;

  IllustrationPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Moon/sun decoration
    paint.color = const Color(0xFFFF6B88);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.15), 15, paint);

    // Tree (red cloud shape)
    paint.color = ThemeConstants.primaryLight;

    // Large cloud shape
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.4), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35), 30, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.35), 25, paint);

    // Small bush
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.55), 15, paint);

    // Person body (dark)
    paint.color = isDark ? const Color(0xFF35383F) : const Color(0xFF2C2F3E);

    // Legs
    final leftLeg = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.32, size.height * 0.65, 12, 30),
      const Radius.circular(6),
    );
    canvas.drawRRect(leftLeg, paint);

    final rightLeg = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.22, size.height * 0.7, 12, 25),
      const Radius.circular(6),
    );
    canvas.drawRRect(rightLeg, paint);

    // Shoes
    paint.color = isDark ? const Color(0xFF25282F) : const Color(0xFF1A1D28);
    canvas.drawCircle(Offset(size.width * 0.38, size.height * 0.96), 6, paint);
    canvas.drawCircle(Offset(size.width * 0.28, size.height * 0.96), 6, paint);

    // Red sweater
    paint.color = ThemeConstants.primaryLight;
    final torso = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.45, 35, 25),
      const Radius.circular(8),
    );
    canvas.drawRRect(torso, paint);

    // Arms
    final leftArm = Path()
      ..moveTo(size.width * 0.2, size.height * 0.5)
      ..lineTo(size.width * 0.1, size.height * 0.6)
      ..lineTo(size.width * 0.12, size.height * 0.63)
      ..lineTo(size.width * 0.22, size.height * 0.53)
      ..close();
    canvas.drawPath(leftArm, paint);

    final rightArm = Path()
      ..moveTo(size.width * 0.55, size.height * 0.5)
      ..lineTo(size.width * 0.65, size.height * 0.55)
      ..lineTo(size.width * 0.63, size.height * 0.58)
      ..lineTo(size.width * 0.53, size.height * 0.53)
      ..close();
    canvas.drawPath(rightArm, paint);

    // Hands
    paint.color = const Color(0xFFFFCCBB);
    canvas.drawCircle(Offset(size.width * 0.11, size.height * 0.62), 5, paint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.56), 5, paint);

    // Head
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.38), 14, paint);

    // Hair
    paint.color = isDark ? const Color(0xFF2C2F3E) : const Color(0xFF1A1D28);
    final hairPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width * 0.35, size.height * 0.32),
          radius: 16,
        ),
      );
    canvas.drawPath(hairPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
