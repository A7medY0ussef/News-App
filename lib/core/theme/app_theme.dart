import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_styles.dart';

class AppTheme {
  static OutlineInputBorder _searchBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color, width: 1),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14Black,
      headlineLarge: AppStyles.medium24Black,
      headlineMedium: AppStyles.medium20Black,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      hintStyle: AppStyles.medium20Black,
      prefixIconColor: AppColors.blackColor,
      suffixIconColor: AppColors.blackColor,
      border: _searchBorder(AppColors.blackColor),
      enabledBorder: _searchBorder(AppColors.blackColor),
      focusedBorder: _searchBorder(AppColors.blackColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    splashColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16,
      labelMedium: AppStyles.medium14White,
      labelSmall: AppStyles.medium12Grey,
      headlineLarge: AppStyles.medium24White,
      headlineMedium: AppStyles.medium20White,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      hintStyle: AppStyles.medium20White,
      prefixIconColor: AppColors.whiteColor,
      suffixIconColor: AppColors.whiteColor,
      border: _searchBorder(AppColors.whiteColor),
      enabledBorder: _searchBorder(AppColors.whiteColor),
      focusedBorder: _searchBorder(AppColors.whiteColor),
    ),
  );
}
