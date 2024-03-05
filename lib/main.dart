import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:schedule_for_ictis_flutter/favorite_schedules/view/favorite_schedules_add_page.dart';
import 'package:schedule_for_ictis_flutter/favorite_schedules/view/favorite_schedules_list_page.dart';
import 'package:schedule_for_ictis_flutter/preferences/view/preferences_page.dart';
import 'package:schedule_for_ictis_flutter/schedule/view/schedule_page.dart';
import 'package:schedule_for_ictis_flutter/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ru_RU', null);
    return MaterialApp(
      theme: lightTheme,
      home: const SchedulePage(),
    );
  }

}