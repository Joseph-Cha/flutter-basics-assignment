import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';

/// Application theme configuration
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Noto_Sans_KR',
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppFontSizes.xLarge,
          fontWeight: FontWeight.bold,
          fontFamily: 'Noto_Sans_KR',
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.iconInactive,
        size: AppIconSizes.medium,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: AppElevation.low,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        elevation: AppElevation.high,
      ),
    );
  }
}
