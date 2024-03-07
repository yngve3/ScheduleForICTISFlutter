import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHeader extends StatelessWidget {
  DateHeader({
    super.key,
    required this.date,
    this.studyWeek = 1
  });

  final DateTime date;
  final int studyWeek;
  final DateFormat dateFormat = DateFormat("EEEE, d MMMM", 'ru_RU');

  @override
  Widget build(BuildContext context) {
    String formattedDate = dateFormat.format(date).firstSymToUpperCase();
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: ListTile(
        title: Text(formattedDate, style: Theme.of(context).textTheme.headlineLarge),
        subtitle: Text("Учебная неделя №$studyWeek"),
      ),
    );
  }
}

extension SymbolsCaseChanging on String {
  String firstSymToUpperCase() {
    return this[0].toUpperCase() + substring(1);
  }
}