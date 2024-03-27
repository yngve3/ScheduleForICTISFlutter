import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/button_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/card_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/input_decorator_theme.dart';

import 'colors.dart';

const String fontNameDefault = 'Roboto';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  cardTheme: cardTheme,
  filledButtonTheme: filledButtonThemeData,
  splashColor: Colors.transparent,
  floatingActionButtonTheme: floatingActionButtonThemeData,
  inputDecorationTheme: inputDecorationTheme,
  textTheme: const TextTheme(

    //headline
    headlineLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.bold,
        fontSize: 26
    ),
    headlineMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 24
    ),

    //title
    titleLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 18
    ),

      //body
      bodyLarge: TextStyle(
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
          height: 1.2,
          fontSize: 16
      ),
    bodyMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: CustomColors.textBodyMediumColor
    ),
    bodySmall: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: CustomColors.textBodyMediumColor
    )
  )
);