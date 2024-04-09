import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import 'date_text.dart';

class DisciplineAndDate extends StatelessWidget {
  const DisciplineAndDate({
    super.key,
    required this.discipline,
    required this.date
  });

  final String discipline;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(discipline, style: context.textTheme.headlineMedium),
        DateText(date: date, style: context.textTheme.bodyLarge!.copyWith(color: context.customColors.accent)),
      ],
    );
  }
}