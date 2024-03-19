import 'package:flutter/material.dart';

import '../../domain/models/schedule_subject/schedule_subject.dart';

typedef ScheduleItemTappedCallback = Function(ScheduleSubject scheduleSubject);

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.scheduleSubject,
    required this.callback,
    this.padding = 20
  });

  final ScheduleSubject scheduleSubject;
  final double padding;
  final ScheduleItemTappedCallback callback;

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
      onTap: () => callback(scheduleSubject),
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