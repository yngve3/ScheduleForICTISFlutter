import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/item_choose_vpk.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/schedule_day_item_widget_factory.dart';

import '../../../domain/models/schedule/day_schedule/day_schedule.dart';

class DayScheduleWidget extends StatefulWidget {
  const DayScheduleWidget({
    super.key,
    required this.daySchedule,
    this.isTouchable = true
  });

  final DaySchedule daySchedule;
  final bool isTouchable;

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
      children: _createItems(context)
    );
  }

  @override
  bool get wantKeepAlive => true;

  List<Widget> _createItems(BuildContext context) {
    List<Widget> items = [];
    if (widget.daySchedule.isVPK) {
      items.add(const ItemChooseVPK());
    }

    items.addAll(widget.daySchedule.items.map((element) =>
        ScheduleDayItemWidgetFactory.create(element, isTouchable: widget.isTouchable))
    );

    return items;
  }
}