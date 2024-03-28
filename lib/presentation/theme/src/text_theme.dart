import 'package:flutter/material.dart';

import '../theme_ext/colors_ext.dart';

const String fontNameDefault = 'Roboto';

TextTheme textThemeData(ThemeColors colors) => TextTheme(
    //headline
    headlineLarge: const TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.bold,
        fontSize: 26
    ),
    headlineMedium: const TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 24
    ),

    //title
    titleLarge: const TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 18
    ),

    //body
    bodyLarge: const TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        height: 1.2,
        fontSize: 16
    ),
    bodyMedium: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: colors.text2
    ),
    bodySmall: TextStyle(
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: colors.text2
    )
);