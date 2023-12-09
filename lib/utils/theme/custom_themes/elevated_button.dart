import 'package:fello/utils/constants/color.dart';
import 'package:flutter/material.dart';

class ThemeElevatedButton {
  ThemeElevatedButton._();

  static ElevatedButtonThemeData lightElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
        shadowColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return 6;
            return 3; // default elevation
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        animationDuration: const Duration(milliseconds: 200)),
  );

  static ElevatedButtonThemeData darkElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
        shadowColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return 6;
            return 3; // default elevation
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        animationDuration: const Duration(milliseconds: 200)),
  );
}
