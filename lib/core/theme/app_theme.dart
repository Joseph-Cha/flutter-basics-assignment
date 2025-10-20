import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_constants.dart';

/// Application theme configuration
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Noto_Sans_KR',
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.iconPrimary,
      ),
    );
  }
}
