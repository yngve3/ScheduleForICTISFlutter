import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/schedule_day_item.dart';

class ItemUnknown implements ScheduleDayItem {
  @override
  Widget buildWidget(BuildContext context) {
    return const ListTile(
      title: Text("unknown item"),
    );
  }
}