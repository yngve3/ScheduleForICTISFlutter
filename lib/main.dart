import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/cubit/schedule_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_page.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/light_theme.dart';

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
      home: BlocProvider(
        create: (_) => ScheduleCubit(),
        child: const SchedulePage(),
      ),
    );
  }

}