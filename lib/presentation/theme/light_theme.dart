import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/button_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/card_theme.dart';

import 'colors.dart';

const String fontNameDefault = 'Roboto';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  cardTheme: cardTheme,
  filledButtonTheme: filledButtonThemeData,
  textTheme: const TextTheme(

    //headline
    headlineLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.bold,
        fontSize: 28
    ),
    headlineMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 26
    ),

    //title
    titleLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 20
    ),

      //body
      bodyLarge: TextStyle(
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
          height: 1.2,
          fontSize: 18
      ),
    bodyMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 16,
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