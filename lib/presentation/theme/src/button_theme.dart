import 'package:flutter/material.dart';

FilledButtonThemeData filledButtonThemeData(TextTheme textTheme) => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(46),
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.bottomCenter,
      textStyle: textTheme.titleLarge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    )
);


FloatingActionButtonThemeData floatingActionButtonThemeData() => const FloatingActionButtonThemeData(
      shape: CircleBorder(),
);