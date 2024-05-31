import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationThemeData(TextTheme textTheme) => InputDecorationTheme(
    labelStyle: textTheme.bodyLarge,
    contentPadding: EdgeInsets.zero,
    filled: true,
    border: InputBorder.none
);