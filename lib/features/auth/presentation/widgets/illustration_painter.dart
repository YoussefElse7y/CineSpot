
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:flutter/material.dart';

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
