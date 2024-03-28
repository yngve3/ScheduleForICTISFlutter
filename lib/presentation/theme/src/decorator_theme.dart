import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';

InputDecorationTheme inputDecorationThemeData(ThemeColors colors, TextTheme textTheme) => InputDecorationTheme(
    labelStyle: textTheme.bodyLarge,
    contentPadding: EdgeInsets.zero,
    filled: true,
    focusColor: colors.text1,
    fillColor: colors.card,
    border: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)
    )
);