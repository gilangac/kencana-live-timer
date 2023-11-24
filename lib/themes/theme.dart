// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kencana_live_timer/utils/sizes.dart';

class AppColor {
  // static const Color primary = Color(0xff8E4AA1);
  static const Color blue = Color(0xff058CD8);
  static const Color yellow = Color(0xffFFB907);
  static const Color green = Color(0xff4CAF50);
  static const Color red = Color(0xffD20808);
  static const Color danger = Color(0xffFD4A4A);
  static const Color lightGrey = Color(0xFFEAE9E9);
  static const Color extraLightGrey = Color(0xffE1E8ED);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF555353);
  static const Color blackgrey = Color(0xFFD4D4D4);
  static const Color grey = Colors.grey;

  static const MaterialColor brown = MaterialColor(
    0xff4E312A,
    <int, Color>{
      50: Color(0xff4E312A),
      100: Color(0xff4E312A),
      200: Color(0xff4E312A),
      300: Color(0xff4E312A),
      400: Color(0xff4E312A),
      500: Color(0xff4E312A),
      600: Color(0xff4E312A),
      700: Color(0xff4E312A),
      800: Color(0xff4E312A),
      900: Color(0xff4E312A),
    },
  );
}

class AssetColor {
  static const Color primaryLight = Color(0xFF36BB7A);
  static const Color onPrimaryLight = Color(0xFFEADCFB);
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color onBackgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceTintLight = Color(0xFFEDEDED);
  static const Color onSurfaceLight = Color(0xFF393939);
  static const Color onSurfaceVariantLight = Color(0xFF3E3E3E);
  static const Color inverseSurfaceLight = Color(0xFF777777);
  static const Color surfaceLight = Color(0xFFA1A1A1);
  static const Color outlineLight = Color(0xFFC1C1C1);

  static const Color primaryDark = Color(0xFFA762FF);
  static const Color onPrimaryDark = Color(0xFF462C65);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color onBackgroundDark = Color(0xFF0E0E0E);
  static const Color surfaceTintDark = Color(0xFF414141);
  static const Color onSurfaceDark = Color(0xFFF9F9F9);
  static const Color onSurfaceVariantDark = Color(0xFFE6E6E6);
  static const Color inverseSurfaceDark = Color(0xFFD8D8D8);
  static const Color surfaceDark = Color(0xFFBABABA);
  static const Color outlineDark = Color(0xFF7A7A7A);

  static const Color pink = Color(0xFFF91980);

  static const Color error = Color(0xFFFF3333);
  static const Color succees = Color(0xFF16AE26);
  static const Color warning = Color(0xFFEB8600);
  static const Color info = Color(0xFF0E65D0);

  static const MaterialColor primarySwatch = MaterialColor(
    0xff8E4AA1,
    <int, Color>{
      50: Color(0xFF36BB7A),
      100: Color(0xFF36BB7A),
      200: Color(0xFF36BB7A),
      300: Color(0xFF36BB7A),
      400: Color(0xFF36BB7A),
      500: Color(0xFF36BB7A),
      600: Color(0xFF36BB7A),
      700: Color(0xFF36BB7A),
      800: Color(0xFF36BB7A),
      900: Color(0xFF36BB7A),
    },
  );
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: AssetColor.primarySwatch,
    scaffoldBackgroundColor: AssetColor.backgroundLight,
    colorScheme: ColorScheme.light(
        background: AssetColor.backgroundLight,
        onBackground: AssetColor.onBackgroundLight, // White
        primary: AssetColor.primaryLight,
        onPrimary: AssetColor.onPrimaryLight,
        surfaceTint: AssetColor.surfaceTintLight, // Surface Container
        onSurface: AssetColor.onSurfaceLight,
        onSurfaceVariant: AssetColor.onSurfaceVariantLight,
        inverseSurface: AssetColor.inverseSurfaceLight, // Surface Dim
        surface: AssetColor.surfaceLight,
        outline: AssetColor.outlineLight,
        error: AssetColor.error,
        secondary: AssetColor.succees, // Success
        tertiary: AssetColor.warning, // Warning
        shadow: AssetColor.surfaceTintLight.withOpacity(0.5),
        secondaryContainer: Colors.grey[300]),
    fontFamily: 'Inter',
    // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    appBarTheme: const AppBarTheme(
      backgroundColor: AssetColor.backgroundLight,
      foregroundColor: AssetColor.onSurfaceLight,
      centerTitle: false,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AssetColor.surfaceTintLight,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AssetColor.surfaceTintLight,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AssetColor.primaryLight, // This is a custom color variable
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
        color: AssetColor.onSurfaceLight,
      ),
      headlineMedium: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w600,
        color: AssetColor.onSurfaceLight,
      ),
      bodyLarge: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
        color: AssetColor.onSurfaceLight,
      ),
      bodyMedium: TextStyle(
        fontSize: FontSize.s12,
        fontWeight: FontWeight.w400,
        color: AssetColor.onSurfaceLight,
      ),
      labelSmall: TextStyle(
        fontSize: FontSize.s10,
        fontWeight: FontWeight.w400,
        color: AssetColor.onSurfaceLight,
        letterSpacing: 0,
      ),
    ).apply(
      fontFamily: 'Inter',
      bodyColor: AssetColor.onSurfaceLight,
      displayColor: AssetColor.onSurfaceLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding:
            EdgeInsets.symmetric(horizontal: Sizes.s16, vertical: Sizes.s16),
        foregroundColor: AssetColor.backgroundLight,
        backgroundColor: AssetColor.primaryLight, // background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w700,
          color: AssetColor.backgroundLight,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding:
            EdgeInsets.symmetric(horizontal: Sizes.s16, vertical: Sizes.s16),
        backgroundColor: AssetColor.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: const BorderSide(color: AssetColor.primaryLight),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w700,
          color: AssetColor.primaryLight,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AssetColor.primaryLight,
      foregroundColor: AssetColor.backgroundLight,
      iconSize: Sizes.s20,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AssetColor.backgroundLight,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AssetColor.backgroundLight,
      shadowColor: AssetColor.surfaceTintLight.withOpacity(0.5),
      elevation: 10,
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.symmetric(
        horizontal: Sizes.paddingHorizontalPage,
      ),
      unselectedLabelColor: AssetColor.onSurfaceLight,
      labelStyle: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w600,
      ),
      labelColor: AssetColor.primaryLight,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: AssetColor.primarySwatch,
    scaffoldBackgroundColor: AssetColor.backgroundDark,
    colorScheme: ColorScheme.dark(
        background: AssetColor.backgroundDark,
        onBackground: AssetColor.onBackgroundDark, // Black
        primary: AssetColor.primaryDark,
        onPrimary: AssetColor.onPrimaryDark,
        surfaceTint: AssetColor.surfaceTintDark, // Surface Container
        onSurface: AssetColor.onSurfaceDark,
        onSurfaceVariant: AssetColor.onSurfaceVariantDark,
        inverseSurface: AssetColor.inverseSurfaceDark, // Surface Dim
        surface: AssetColor.surfaceDark,
        outline: AssetColor.outlineDark,
        error: AssetColor.error,
        secondary: AssetColor.succees, // Success
        tertiary: AssetColor.warning, // Warning
        shadow: AssetColor.surfaceTintDark.withOpacity(0.5),
        secondaryContainer: AssetColor.surfaceTintDark.withOpacity(0.5)),
    fontFamily: 'Inter',
    // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    appBarTheme: const AppBarTheme(
      backgroundColor: AssetColor.backgroundDark,
      foregroundColor: AssetColor.onSurfaceDark,
      centerTitle: false,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AssetColor.primaryDark, // This is a custom color variable
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: FontSize.s12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        fontSize: FontSize.s10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    ).apply(
      fontFamily: 'Inter',
      bodyColor: AssetColor.onSurfaceDark,
      displayColor: AssetColor.onSurfaceDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding:
            EdgeInsets.symmetric(horizontal: Sizes.s16, vertical: Sizes.s16),
        foregroundColor: AssetColor.backgroundLight,
        backgroundColor: AssetColor.primaryDark, // background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w700,
          color: AssetColor.backgroundLight,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding:
            EdgeInsets.symmetric(horizontal: Sizes.s16, vertical: Sizes.s16),
        backgroundColor: AssetColor.backgroundDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: const BorderSide(color: AssetColor.primaryDark),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w700,
          color: AssetColor.primaryDark,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AssetColor.primaryDark,
      foregroundColor: AssetColor.backgroundLight,
      iconSize: Sizes.s20,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AssetColor.backgroundDark,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AssetColor.backgroundDark,
      shadowColor: AssetColor.surfaceTintDark.withOpacity(0.5),
      elevation: 10,
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.symmetric(
        horizontal: Sizes.paddingHorizontalPage,
      ),
      unselectedLabelColor: AssetColor.onSurfaceDark,
      labelStyle: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w600,
      ),
      labelColor: AssetColor.primaryDark,
      indicatorSize: TabBarIndicatorSize.label,
    ),
  );
}
