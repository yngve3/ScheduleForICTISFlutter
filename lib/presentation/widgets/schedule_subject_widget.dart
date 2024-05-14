import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/utils/constants/callbacks.dart';

import '../../domain/models/schedule_subject/schedule_subject.dart';

class ScheduleSubjectWidget extends StatelessWidget {
  const ScheduleSubjectWidget({
    super.key,
    required this.scheduleSubject,
    required this.onTap,
    this.padding = 20
  });

  final ScheduleSubject scheduleSubject;
  final double padding;
  final ScheduleSubjectCallback onTap;

  TextStyle? _getTextStyle(BuildContext context) {
    if (!scheduleSubject.isChosen) {
      return Theme.of(context).textTheme.bodyLarge;
    }

    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: Colors.white
    );
  }

  Color? _getCardColor(BuildContext context) {
    if (!scheduleSubject.isChosen) {
      return null;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(scheduleSubject),
      child: Card(
        color: _getCardColor(context),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
              scheduleSubject.name,
              style: _getTextStyle(context)
          ),
        ),
      ),
    );
  }
}