import 'package:fello/utils/constants/color.dart';
import 'package:flutter/material.dart';

class ThemeText {
  ThemeText._();

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: const TextStyle().copyWith(color: AppColors.light),
    bodyMedium: const TextStyle().copyWith(color: AppColors.light),
    bodySmall: const TextStyle().copyWith(color: AppColors.light),
    displayLarge: const TextStyle().copyWith(color: AppColors.light),
    displayMedium: const TextStyle().copyWith(color: AppColors.light),
    displaySmall: const TextStyle().copyWith(color: AppColors.light),
    headlineLarge: const TextStyle().copyWith(color: AppColors.light),
    headlineMedium: const TextStyle().copyWith(color: AppColors.light),
    headlineSmall: const TextStyle().copyWith(color: AppColors.light),
    labelLarge: const TextStyle().copyWith(color: AppColors.light),
    labelMedium: const TextStyle().copyWith(color: AppColors.light),
    labelSmall: const TextStyle().copyWith(color: AppColors.light),
    titleLarge: const TextStyle().copyWith(color: AppColors.light),
    titleMedium: const TextStyle().copyWith(color: AppColors.light),
    titleSmall: const TextStyle().copyWith(color: AppColors.light),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: const TextStyle().copyWith(color: AppColors.dark),
    bodyMedium: const TextStyle().copyWith(color: AppColors.dark),
    bodySmall: const TextStyle().copyWith(color: AppColors.dark),
    displayLarge: const TextStyle().copyWith(color: AppColors.dark),
    displayMedium: const TextStyle().copyWith(color: AppColors.dark),
    displaySmall: const TextStyle().copyWith(color: AppColors.dark),
    headlineLarge: const TextStyle().copyWith(color: AppColors.dark),
    headlineMedium: const TextStyle().copyWith(color: AppColors.dark),
    headlineSmall: const TextStyle().copyWith(color: AppColors.dark),
    labelLarge: const TextStyle().copyWith(color: AppColors.dark),
    labelMedium: const TextStyle().copyWith(color: AppColors.dark),
    labelSmall: const TextStyle().copyWith(color: AppColors.dark),
    titleLarge: const TextStyle().copyWith(color: AppColors.dark),
    titleMedium: const TextStyle().copyWith(color: AppColors.dark),
    titleSmall: const TextStyle().copyWith(color: AppColors.dark),
  );
}

