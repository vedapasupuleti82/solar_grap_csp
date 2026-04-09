import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF9800);
  static const Color primaryDark = Color(0xFFE65100);
  static const Color background = Color(0xFFF9FAFB);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF555555);
  static const Color accent = Color(0xFFFFF3E0);
  static const Color gradientStart = Color(0xFFFF9800);
  static const Color gradientEnd = Color(0xFFFF5722);
  
  static const Color success = Color(0xFF4CAF50); // Kept for eco/checks
  static const Color error = Color(0xFFF44336);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppShadows {
  static final BoxShadow cardShadow = BoxShadow(
    color: Colors.black.withValues(alpha: 0.08),
    blurRadius: 24,
    offset: const Offset(0, 8),
  );
  
  static final BoxShadow primaryShadow = BoxShadow(
    color: AppColors.primary.withValues(alpha: 0.3),
    blurRadius: 16,
    offset: const Offset(0, 8),
  );
}
