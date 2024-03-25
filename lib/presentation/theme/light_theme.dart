import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/button_theme.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/card_theme.dart';

import 'colors.dart';

const String fontNameDefault = 'Roboto';
const double offsetSize = 2;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  cardTheme: cardTheme,
  filledButtonTheme: filledButtonThemeData,
  splashColor: Colors.transparent,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: CustomColors.accentColor,
    shape: CircleBorder(),
  ),
  textTheme: const TextTheme(

    //headline
    headlineLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.bold,
        fontSize: 24 + offsetSize
    ),
    headlineMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 22 + offsetSize
    ),

    //title
    titleLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 16 + offsetSize
    ),

      //body
      bodyLarge: TextStyle(
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
          height: 1.2,
          fontSize: 14 + offsetSize
      ),
    bodyMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 12 + offsetSize,
      color: CustomColors.textBodyMediumColor
    ),
    bodySmall: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 10 + offsetSize,
        color: CustomColors.textBodyMediumColor
    )
  )
);