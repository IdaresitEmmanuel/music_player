import 'package:flutter/material.dart';
import 'package:music_player/features/music/presentation/core/theme/colors.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';

ThemeData get darkTheme => ThemeData(
      primaryColor: AppColors.primaryColor,
      primarySwatch: primarySwatch,
      cardColor: AppColors.cardColorDark,
      iconTheme: IconThemeData(color: AppColors.iconColorDark),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFF5F1F1)),
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: AppColors.dividerColorDark,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: const Color(0xFF37374a),
      fontFamily: "Quicksand",
      primaryTextTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: AppDimentions.largeText, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
          fontSize: AppDimentions.bodyTextMedium,
        ),
        bodyLarge: TextStyle(
          fontSize: AppDimentions.bodyTextLarge,
        ),
        bodyMedium: TextStyle(
          fontSize: AppDimentions.bodyTextMedium,
        ),
        bodySmall: TextStyle(
          fontSize: AppDimentions.bodyTextSmall,
        ),
      ),
    );

ThemeData get lightTheme => ThemeData(
      primaryColor: AppColors.primaryColor,
      primarySwatch: primarySwatch,
      cardColor: AppColors.cardColor,
      iconTheme: IconThemeData(color: AppColors.iconColor),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFF5F1F1)),
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: AppColors.dividerColor,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Quicksand",
      primaryTextTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: AppDimentions.largeText, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
          fontSize: AppDimentions.bodyTextMedium,
        ),
        bodyLarge: TextStyle(
          fontSize: AppDimentions.bodyTextLarge,
        ),
        bodyMedium: TextStyle(
          fontSize: AppDimentions.bodyTextMedium,
        ),
        bodySmall: TextStyle(
          fontSize: AppDimentions.bodyTextSmall,
        ),
      ),
    );

var primarySwatch = MaterialColor(0xFFFC8224, <int, Color>{
  50: AppColors.primaryColor.withOpacity(0.05),
  100: AppColors.primaryColor.withOpacity(0.1),
  200: AppColors.primaryColor.withOpacity(0.2),
  300: AppColors.primaryColor.withOpacity(0.3),
  400: AppColors.primaryColor.withOpacity(0.4),
  500: AppColors.primaryColor.withOpacity(0.5),
  600: AppColors.primaryColor.withOpacity(0.6),
  700: AppColors.primaryColor.withOpacity(0.7),
  800: AppColors.primaryColor.withOpacity(0.8),
  900: AppColors.primaryColor.withOpacity(0.9),
});
