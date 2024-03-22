import 'package:flutter/material.dart';

import '../../../domain/models/couple/couple_type.dart';
import '../../../domain/models/schedule/day_schedule_item.dart';
import '../../theme/colors.dart';

abstract class ScheduleDayItem {
  Widget buildWidget(BuildContext context);
}

class EventItem implements ScheduleDayItem {
  const EventItem({
    required this.event
  });

  final Event event;

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.cardBackgroundColor,
      ),
      child: Row(
        children: [
          TimeLeftPanel(timeStart: event.timeStart, timeEnd: event.timeEnd),
          Expanded(
              child: Column(
                children: [
                  Text(event.title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400
                  )),
                  Text(event.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400
                  ))
                ],
              )
          )
        ],
      ),
    );
  }
}

class UnknownItem implements ScheduleDayItem {
  @override
  Widget buildWidget(BuildContext context) {
    return const ListTile(
      title: Text("unknown item"),
    );
  }
}

class CouplesItem implements ScheduleDayItem {
  const CouplesItem({
    required this.couple
  });

  final Couple couple;

  Color _getDividerColor() {
    if (couple.isOnline) return CustomColors.green;

    return CustomColors.accentColor;
  }

  Color _getCircleColor() {
    switch (couple.type) {
      case CoupleType.laboratory: return CustomColors.red;
      case CoupleType.practice: return CustomColors.yellow;
      case CoupleType.lecture: return CustomColors.green;
      case CoupleType.exam: return Colors.black;
      case CoupleType.none: return CustomColors.green;
      case null:
        return Colors.transparent;
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.cardBackgroundColor,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            TimeLeftPanel(timeStart: couple.timeStart, timeEnd: couple.timeEnd),
            VerticalDivider(thickness: 1, color: _getDividerColor()),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(couple.audiences, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 8),
                          Icon(Icons.circle, color: _getCircleColor()),
                          const SizedBox(width: 8),
                          Text(
                              couple.type.name,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: CustomColors.textBodyMediumColor
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                          couple.discipline,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400
                          )
                      ),
                      const SizedBox(height: 5),
                      Text(
                          couple.lecturers,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400
                          )
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

class TimeLeftPanel extends StatelessWidget {
  const TimeLeftPanel({
    super.key,
    required this.timeStart,
    required this.timeEnd
  });

  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(timeStart.format(context), style: Theme.of(context).textTheme.bodyLarge),
          Text(timeEnd.format(context), style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }

}