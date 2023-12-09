import 'package:fello/utils/constants/color.dart';
import 'package:fello/utils/theme/custom_themes/appbar.dart';
import 'package:fello/utils/theme/custom_themes/elevated_button.dart';
import 'package:fello/utils/theme/custom_themes/input_decoration.dart';
import 'package:fello/utils/theme/custom_themes/text.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
    textTheme: ThemeText.lightTextTheme,
    appBarTheme: ThemeAppBar.lightAppBarTheme,
    elevatedButtonTheme: ThemeElevatedButton.lightElevatedButtonThemeData,
    inputDecorationTheme: ThemeInputDecoration.lightInputDecoration,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
    textTheme: ThemeText.darkTextTheme,
    appBarTheme: ThemeAppBar.darkAppBarTheme,
    elevatedButtonTheme: ThemeElevatedButton.darkElevatedButtonThemeData,
    inputDecorationTheme: ThemeInputDecoration.darkInputDecoration,
  );
}
