import 'package:fello/utils/constants/color.dart';
import 'package:flutter/material.dart';

class ThemeInputDecoration {
  ThemeInputDecoration._();

  static InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.dark,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.light,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorStyle: const TextStyle(
      color: Colors.red,
      fontSize: 12,
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),
    labelStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),
  );

  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.light,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.dark,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    errorStyle: const TextStyle(
      color: Colors.red,
      fontSize: 12,
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),
    labelStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),
  );
}
