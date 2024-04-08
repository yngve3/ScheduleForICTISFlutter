import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/item_choose_vpk.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/item_couple.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/item_event.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/item_unknown.dart';

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
      children: _createItems(context)
    );
  }

  @override
  bool get wantKeepAlive => true;

  List<Widget> _createItems(BuildContext context) {
    List<Widget> items = [];
    if (widget.daySchedule.isVPK) {
      items.add(ItemChooseVPK().buildWidget(context));
    }

    items.addAll(widget.daySchedule.items.map((element) {
      return switch (element) {
        Couple _=> ItemCouple(couple: element).buildWidget(context),
        Event _=> ItemEvent(event: element).buildWidget(context),
        _=> ItemUnknown().buildWidget(context)
      };
    }));

    return items;
  }
}