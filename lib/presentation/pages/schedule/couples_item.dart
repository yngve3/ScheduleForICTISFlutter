import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

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
        color: context.customColors.card,
      ),
      child: Row(
        children: [
          TimeLeftPanel(timeStart: event.timeStart, timeEnd: event.timeEnd),
          Expanded(
              child: Column(
                children: [
                  Text(event.title, style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400
                  )),
                  Text(event.description, style: context.textTheme.bodyMedium?.copyWith(
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

  Color _getDividerColor(BuildContext context) {
    if (couple.isOnline) return context.customColors.greenIndicator;

    return context.customColors.accent;
  }

  Color _getCircleColor(BuildContext context) {
    switch (couple.type) {
      case CoupleType.laboratory: return context.customColors.redIndicator;
      case CoupleType.practice: return context.customColors.yellowIndicator;
      case CoupleType.lecture: return context.customColors.greenIndicator;
      case CoupleType.exam: return context.customColors.text1;
      case CoupleType.none: return context.customColors.greenIndicator;
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
        color: context.customColors.card,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            TimeLeftPanel(timeStart: couple.timeStart, timeEnd: couple.timeEnd),
            VerticalDivider(thickness: 1, color: _getDividerColor(context)),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(couple.audiences, style: context.textTheme.bodyLarge),
                          const SizedBox(width: 8),
                          Icon(Icons.circle, color: _getCircleColor(context)),
                          const SizedBox(width: 8),
                          Text(
                              couple.type.name,
                              style: context.textTheme.bodyLarge?.copyWith(
                                  color: context.customColors.text2
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                          couple.discipline,
                          softWrap: true,
                          style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400
                          )
                      ),
                      const SizedBox(height: 5),
                      Text(
                          couple.lecturers,
                          style: context.textTheme.bodyMedium?.copyWith(
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
          Text(timeStart.format(context), style: context.textTheme.bodyLarge),
          Text(timeEnd.format(context), style: context.textTheme.bodySmall)
        ],
      ),
    );
  }

}