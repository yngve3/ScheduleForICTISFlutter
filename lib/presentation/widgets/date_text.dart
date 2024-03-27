import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateText extends StatelessWidget {
  DateText({
    super.key,
    this.date,
    this.style
  });

  final DateTime? date;
  final TextStyle? style;

  final DateFormat dateFormat = DateFormat("EEEE, d MMMM", 'ru_RU');

  @override
  Widget build(BuildContext context) {
    if (date == null) {
      return const Text("");
    }
    String formattedDate = dateFormat.format(date!).firstSymToUpperCase();
    return Text(formattedDate, style: style);
  }

}

extension on String {
  String firstSymToUpperCase() {
    return this[0].toUpperCase() + substring(1);
  }
}