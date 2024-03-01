import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/themes/colors.dart';

const String fontNameDefault = 'Roboto';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  cardTheme: CardTheme(
    elevation: 0,
    color: CustomColors.cardBackgroundColor,
    margin: const EdgeInsets.only(top: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    )
  ),


  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: CustomColors.accentColor,
      minimumSize: const Size.fromHeight(46),
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.bottomCenter,
      textStyle: const TextStyle(
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
          fontSize: 18
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    )
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: Colors.black,
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
  ),

  textTheme: const TextTheme(

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

    titleLarge: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 20
    ),

      bodyLarge: TextStyle(
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
          fontSize: 18
      ),
    bodyMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      color: CustomColors.textBodyMediumColor
    )
  )
);