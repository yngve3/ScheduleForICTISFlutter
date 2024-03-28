import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';

CardTheme cardThemeData(ThemeColors colors) => CardTheme(
    elevation: 0,
    color: colors.card,
    margin: const EdgeInsets.only(top: 10),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
    )
);