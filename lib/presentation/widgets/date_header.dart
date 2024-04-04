import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/date_text.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({
    super.key,
    required this.date,
    this.studyWeek = 1
  });

  final DateTime date;
  final int? studyWeek;

  String _getSubtitle() {
    if (studyWeek != null) {
      return "Учебная неделя №$studyWeek";
    } else {
      return "Учебная группа не выбрана";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        title: DateText(date: date, style: Theme.of(context).textTheme.headlineLarge),
        subtitle: Text(_getSubtitle()),
      ),
    );
  }
}