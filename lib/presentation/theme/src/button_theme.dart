import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';

FilledButtonThemeData filledButtonThemeData(ThemeColors colors, TextTheme textTheme) => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: colors.accent,
      minimumSize: const Size.fromHeight(46),
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.bottomCenter,
      textStyle: textTheme.titleLarge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    )
);

FloatingActionButtonThemeData floatingActionButtonThemeData(ThemeColors colors) => FloatingActionButtonThemeData(
      backgroundColor: colors.accent,
      shape: const CircleBorder(),
);