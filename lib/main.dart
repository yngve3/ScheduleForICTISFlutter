import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/preferences/view/preferences_page.dart';
import 'package:schedule_for_ictis_flutter/themes/light_theme.dart';

void main() {
  runApp(MaterialApp(
    theme: lightTheme,
    home: const PreferencesPage(),
  ));
}