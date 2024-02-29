import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/favorite_schedules/view/favorite_schedules_list_page.dart';
import 'package:schedule_for_ictis_flutter/preferences/view/preferences_page.dart';
import 'package:schedule_for_ictis_flutter/themes/light_theme.dart';

void main() {
  runApp(MaterialApp(
    theme: lightTheme,
    home: const FavoriteSchedulesListPage(),
  ));
}