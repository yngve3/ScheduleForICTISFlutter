import 'package:flutter/material.dart';

import '../models/fav_schedule.dart';

class FavoriteSchedulesItem extends StatelessWidget {
  const FavoriteSchedulesItem({super.key, required this.favSchedule});

  final FavSchedule favSchedule;

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
    return Card(
      color: _getCardColor(context),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
            favSchedule.name,
            style: _getTextStyle(context)
        ),
      ),
    );
  }
}