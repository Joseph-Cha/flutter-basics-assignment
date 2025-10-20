import 'package:flutter/material.dart';

/// App-wide color constants - Material 3 inspired design
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary colors
  static const Color primary = Color(0xFF6750A4); // Purple
  static const Color primaryContainer = Color(0xFFEADDFF);
  static const Color secondary = Color(0xFF625B71);
  static const Color secondaryContainer = Color(0xFFE8DEF8);

  // Accent colors
  static const Color accent = Color(0xFFFF6B6B); // Soft red for FAB
  static const Color accentLight = Color(0xFFFFE5E5);
  static const Color starYellow = Color(0xFFFFC107);
  static const Color starYellowLight = Color(0xFFFFF8E1);

  // Success/Done colors
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFFE8F5E9);

  // Background colors
  static const Color background = Color(0xFFF5F5F7); // Light grey background
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFFAFAFA);

  // Text colors
  static const Color textPrimary = Color(0xFF1C1B1F);
  static const Color textSecondary = Color(0xFF49454F);
  static const Color textTertiary = Color(0xFF79747E);
  static const Color textDisabled = Color(0xFFCAC4D0);

  // Border colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFF0F0F0);

  // Icon colors
  static const Color iconActive = Color(0xFF6750A4);
  static const Color iconInactive = Color(0xFF79747E);

  // Shadow colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Favorite highlight
  static const Color favoriteBackground = Color(0xFFFFF9E6);
  static const Color favoriteBorder = Color(0xFFFFE082);
}

/// App-wide spacing constants
class AppSpacing {
  AppSpacing._();

  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
}

/// App-wide border radius constants
class AppBorderRadius {
  AppBorderRadius._();

  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double round = 100.0;
}

/// App-wide font sizes
class AppFontSizes {
  AppFontSizes._();

  static const double xs = 12.0;
  static const double small = 14.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double xLarge = 24.0;
  static const double xxLarge = 28.0;
}

/// App-wide icon sizes
class AppIconSizes {
  AppIconSizes._();

  static const double xs = 16.0;
  static const double small = 20.0;
  static const double medium = 24.0;
  static const double large = 32.0;
  static const double xLarge = 48.0;
  static const double xxLarge = 80.0;
}

/// App-wide elevation constants
class AppElevation {
  AppElevation._();

  static const double none = 0.0;
  static const double low = 1.0;
  static const double medium = 2.0;
  static const double high = 4.0;
  static const double veryHigh = 8.0;
}
