import 'package:flutter/material.dart';

import 'colors.dart';

class AppColorScheme {
  static get dark => const ColorScheme(
    brightness: Brightness.dark,
    primary: CustomColors.blue,
    onPrimary: Colors.white,
    secondary: CustomColors.grey2,
    onSecondary: Colors.black,
    error: CustomColors.red,
    onError: Colors.white,
    background: Colors.black,
    onBackground: Colors.white,
    surface: CustomColors.grey7,
    onSurface: Colors.white,
    tertiary: CustomColors.grey5,
    onTertiary: Colors.white,
    secondaryContainer: CustomColors.grey6,
    onSecondaryContainer: Colors.white
  );

  static get light => const ColorScheme(
    brightness: Brightness.light,
    primary: CustomColors.blue,
    onPrimary: Colors.white,
    secondary: CustomColors.grey6,
    onSecondary: Colors.black,
    error: CustomColors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: CustomColors.grey1,
    onSurface: Colors.black,
    tertiary: CustomColors.grey5,
    onTertiary: Colors.black,
    secondaryContainer: CustomColors.grey2,
    onSecondaryContainer: Colors.black
  );
}