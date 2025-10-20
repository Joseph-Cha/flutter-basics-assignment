import 'package:flutter/material.dart';

/// App-wide color constants - Material 3 inspired design
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ============ LIGHT THEME COLORS ============

  // Primary colors (Light)
  static const Color lightPrimary = Color(0xFF6750A4); // Purple
  static const Color lightPrimaryContainer = Color(0xFFEADDFF);
  static const Color lightSecondary = Color(0xFF625B71);
  static const Color lightSecondaryContainer = Color(0xFFE8DEF8);

  // Accent colors (Light)
  static const Color lightAccent = Color(0xFFFF6B6B); // Soft red for FAB
  static const Color lightAccentLight = Color(0xFFFFE5E5);
  static const Color lightStarYellow = Color(0xFFFFC107);
  static const Color lightStarYellowLight = Color(0xFFFFF8E1);

  // Success/Done colors (Light)
  static const Color lightSuccess = Color(0xFF4CAF50);
  static const Color lightSuccessLight = Color(0xFFE8F5E9);

  // Background colors (Light)
  static const Color lightBackground = Color(0xFFF5F5F7);
  static const Color lightSurface = Colors.white;
  static const Color lightSurfaceVariant = Color(0xFFFAFAFA);

  // Text colors (Light)
  static const Color lightTextPrimary = Color(0xFF1C1B1F);
  static const Color lightTextSecondary = Color(0xFF49454F);
  static const Color lightTextTertiary = Color(0xFF79747E);
  static const Color lightTextDisabled = Color(0xFFCAC4D0);

  // Border colors (Light)
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightBorderLight = Color(0xFFF0F0F0);

  // Icon colors (Light)
  static const Color lightIconActive = Color(0xFF6750A4);
  static const Color lightIconInactive = Color(0xFF79747E);

  // Shadow colors (Light)
  static const Color lightShadow = Color(0x1A000000);
  static const Color lightShadowDark = Color(0x33000000);

  // Favorite highlight (Light)
  static const Color lightFavoriteBackground = Color(0xFFFFF9E6);
  static const Color lightFavoriteBorder = Color(0xFFFFE082);

  // ============ DARK THEME COLORS ============

  // Primary colors (Dark)
  static const Color darkPrimary = Color(0xFFD0BCFF); // Lighter purple for dark mode
  static const Color darkPrimaryContainer = Color(0xFF4F378B);
  static const Color darkSecondary = Color(0xFFCCC2DC);
  static const Color darkSecondaryContainer = Color(0xFF4A4458);

  // Accent colors (Dark)
  static const Color darkAccent = Color(0xFFFF8A80); // Brighter soft red for dark mode
  static const Color darkAccentLight = Color(0xFF5D3A3A);
  static const Color darkStarYellow = Color(0xFFFFD54F);
  static const Color darkStarYellowLight = Color(0xFF4A3C1F);

  // Success/Done colors (Dark)
  static const Color darkSuccess = Color(0xFF81C784);
  static const Color darkSuccessLight = Color(0xFF2E4A2F);

  // Background colors (Dark)
  static const Color darkBackground = Color(0xFF1C1B1F);
  static const Color darkSurface = Color(0xFF2B2930);
  static const Color darkSurfaceVariant = Color(0xFF3A3841);

  // Text colors (Dark)
  static const Color darkTextPrimary = Color(0xFFE6E1E5);
  static const Color darkTextSecondary = Color(0xFFCAC4D0);
  static const Color darkTextTertiary = Color(0xFF938F99);
  static const Color darkTextDisabled = Color(0xFF605D66);

  // Border colors (Dark)
  static const Color darkBorder = Color(0xFF49454F);
  static const Color darkBorderLight = Color(0xFF3A3841);

  // Icon colors (Dark)
  static const Color darkIconActive = Color(0xFFD0BCFF);
  static const Color darkIconInactive = Color(0xFF938F99);

  // Shadow colors (Dark)
  static const Color darkShadow = Color(0x33000000);
  static const Color darkShadowDark = Color(0x66000000);

  // Favorite highlight (Dark)
  static const Color darkFavoriteBackground = Color(0xFF3E3419);
  static const Color darkFavoriteBorder = Color(0xFF625B2F);

  // ============ CONTEXT-AWARE GETTERS ============

  static Color primary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkPrimary
          : lightPrimary;

  static Color primaryContainer(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkPrimaryContainer
          : lightPrimaryContainer;

  static Color secondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSecondary
          : lightSecondary;

  static Color secondaryContainer(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSecondaryContainer
          : lightSecondaryContainer;

  static Color accent(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkAccent
          : lightAccent;

  static Color accentLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkAccentLight
          : lightAccentLight;

  static Color starYellow(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkStarYellow
          : lightStarYellow;

  static Color starYellowLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkStarYellowLight
          : lightStarYellowLight;

  static Color success(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSuccess
          : lightSuccess;

  static Color successLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSuccessLight
          : lightSuccessLight;

  static Color background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkBackground
          : lightBackground;

  static Color surface(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSurface
          : lightSurface;

  static Color surfaceVariant(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkSurfaceVariant
          : lightSurfaceVariant;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkTextPrimary
          : lightTextPrimary;

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkTextSecondary
          : lightTextSecondary;

  static Color textTertiary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkTextTertiary
          : lightTextTertiary;

  static Color textDisabled(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkTextDisabled
          : lightTextDisabled;

  static Color border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkBorder
          : lightBorder;

  static Color borderLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkBorderLight
          : lightBorderLight;

  static Color iconActive(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkIconActive
          : lightIconActive;

  static Color iconInactive(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkIconInactive
          : lightIconInactive;

  static Color shadow(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkShadow
          : lightShadow;

  static Color shadowDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkShadowDark
          : lightShadowDark;

  static Color favoriteBackground(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkFavoriteBackground
          : lightFavoriteBackground;

  static Color favoriteBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkFavoriteBorder
          : lightFavoriteBorder;
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
