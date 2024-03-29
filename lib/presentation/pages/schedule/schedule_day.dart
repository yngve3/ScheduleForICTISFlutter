import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/couples_item.dart';

import '../../../domain/models/schedule/day_schedule/day_schedule.dart';
import '../../../domain/models/schedule/day_schedule_item.dart';

class DayScheduleWidget extends StatefulWidget {
  const DayScheduleWidget({
    super.key,
    required this.daySchedule
  });

  final DaySchedule daySchedule;

  @override
  State<StatefulWidget> createState() => _DaySchedule();
}

class _DaySchedule extends State<DayScheduleWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      children: widget.daySchedule.items.map((element) {
        if (element is Couple) {
          return CouplesItem(couple: element).buildWidget(context);
        } else if (element is Event) {
          return EventItem(event: element).buildWidget(context);
        }

        return UnknownItem().buildWidget(context);
      }).toList()
    );
  }

  @override
  bool get wantKeepAlive => true;
}