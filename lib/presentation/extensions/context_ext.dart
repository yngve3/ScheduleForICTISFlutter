import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/theme_ext/colors_ext.dart';

extension BuildContextExt on BuildContext {
  ThemeColors get customColors => Theme.of(this).extension<ThemeColors>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
}