import 'package:fello/utils/constants/color.dart';
import 'package:flutter/material.dart';

class ThemeAppBar{
  ThemeAppBar._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.lightShade4,

  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.darkShade4,
  );
}