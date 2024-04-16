import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/schedule_day_item.dart';

import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../route/routes.dart';
import '../../../widgets/card_with_time_on_left.dart';

class ItemEvent implements ScheduleDayItem {
  const ItemEvent({
    required this.event
  });

  final Event event;

  @override
  Widget buildWidget(BuildContext context) {
    return InkWell(
      onTap: () => context.go(Routes.eventInfo.path({"event_id": event.id})),
      child: CardWithTimeOnLeft(
        timeStart: event.timeStart,
        timeEnd: event.timeEnd,
        color: context.customColors.accent,
        timePanelTopPadding: 5,
        dividerColor: context.customColors.background,
        timeStartTextStyle: context.textTheme.bodyLarge!.copyWith(
            color: context.customColors.background
        ),
        timeEndTextStyle: context.textTheme.bodySmall!.copyWith(
            color: context.customColors.card
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: context.textTheme.bodyLarge!.copyWith(
                color: context.customColors.background
            )),
            const SizedBox(height: 5),
            Text(event.location ?? "", style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: context.customColors.card
            ))
          ],
        ),
      ),
    );
  }
}
