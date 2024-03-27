import 'package:flutter/material.dart';

import '../colors.dart';

FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: CustomColors.accentColor,
      minimumSize: const Size.fromHeight(46),
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.bottomCenter,
      textStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 18
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    )
);

FloatingActionButtonThemeData floatingActionButtonThemeData = const FloatingActionButtonThemeData(
      backgroundColor: CustomColors.accentColor,
      shape: CircleBorder(),
);