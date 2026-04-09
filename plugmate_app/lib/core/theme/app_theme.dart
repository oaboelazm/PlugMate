import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF131313);
  static const surfaceContainerLow = Color(0xFF1C1B1B);
  static const surfaceContainerHigh = Color(0xFF2A2A2A);
  static const onSurface = Color(0xFFE5E2E1);
  static const onSurfaceVariant = Color(0xFFBAC9CC);
  static const primary = Color(0xFF00E5FF);
  static const primarySoft = Color(0xFFC3F5FF);
  static const success = Color(0xFF1FE296);
  static const secondary = Color(0xFFD8B9FF);
}

class AppTheme {
  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surfaceContainerLow,
      onSurface: AppColors.onSurface,
      error: Color(0xFFFFB4AB),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.surfaceContainerLow,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: AppColors.primarySoft,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(color: AppColors.onSurface),
        labelMedium: TextStyle(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
