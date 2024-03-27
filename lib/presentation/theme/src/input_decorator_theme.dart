import 'package:flutter/material.dart';

import '../colors.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.zero,
    filled: true,
    focusColor: Colors.black,
    fillColor: CustomColors.cardBackgroundColor,
    border: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)
    )
);