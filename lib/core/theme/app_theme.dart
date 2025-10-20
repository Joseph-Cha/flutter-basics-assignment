import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';

/// Application theme configuration
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Noto_Sans_KR',
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        surface: AppColors.lightSurface,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightSurface,
        foregroundColor: AppColors.lightTextPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.lightTextPrimary,
          fontSize: AppFontSizes.xLarge,
          fontWeight: FontWeight.bold,
          fontFamily: 'Noto_Sans_KR',
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.lightIconInactive,
        size: AppIconSizes.medium,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: AppElevation.low,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightAccent,
        foregroundColor: Colors.white,
        elevation: AppElevation.high,
      ),
      dividerColor: AppColors.lightBorderLight,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Noto_Sans_KR',
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.darkTextPrimary,
          fontSize: AppFontSizes.xLarge,
          fontWeight: FontWeight.bold,
          fontFamily: 'Noto_Sans_KR',
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.darkIconInactive,
        size: AppIconSizes.medium,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: AppElevation.low,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkAccent,
        foregroundColor: Colors.white,
        elevation: AppElevation.high,
      ),
      dividerColor: AppColors.darkBorderLight,
    );
  }
}
