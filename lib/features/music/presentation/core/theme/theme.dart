import 'package:flutter/material.dart';
import 'package:music_player/features/music/presentation/core/theme/colors.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';

ThemeData get darkTheme => ThemeData(
      primaryColor: AppColors.primaryColor,
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
