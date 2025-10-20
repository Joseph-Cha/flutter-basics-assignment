import 'package:flutter/material.dart';

/// App-wide color constants
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  static const Color primaryRed = Colors.red;
  static const Color primaryAmber = Colors.amber;
  static const Color primaryBlue = Colors.blue;

  static final Color backgroundColor = Colors.grey.shade300;
  static const Color cardBackground = Colors.white60;
  static const Color containerBackground = Colors.white;
  static const Color appBarBackground = Colors.white;

  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black87;
  static const Color textHint = Colors.black54;
  static const Color textDisabled = Colors.black38;

  static const Color iconPrimary = Colors.black;
  static const Color iconSecondary = Colors.grey;

  static const Color shadowColor = Colors.black26;
}

/// App-wide spacing constants
class AppSpacing {
  AppSpacing._();

  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
}

/// App-wide border radius constants
class AppBorderRadius {
  AppBorderRadius._();

  static const double sm = 10.0;
  static const double md = 12.0;
}

/// App-wide font sizes
class AppFontSizes {
  AppFontSizes._();

  static const double small = 14.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double xLarge = 24.0;
}

/// App-wide icon sizes
class AppIconSizes {
  AppIconSizes._();

  static const double small = 24.0;
  static const double medium = 32.0;
  static const double large = 100.0;
}
