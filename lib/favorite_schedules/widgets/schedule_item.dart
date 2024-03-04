import 'package:flutter/material.dart';

import '../models/fav_schedule.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.favSchedule,
    this.padding = 20
  });

  final FavSchedule favSchedule;
  final double padding;

  TextStyle? _getTextStyle(BuildContext context) {
    if (!favSchedule.isChosen) {
      return Theme.of(context).textTheme.bodyLarge;
    }

    return Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: Colors.white
    );
  }

  Color? _getCardColor(BuildContext context) {
    if (!favSchedule.isChosen) {
      return null;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: _getCardColor(context),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
              favSchedule.name,
              style: _getTextStyle(context)
          ),
        ),
      ),
    );
  }
}