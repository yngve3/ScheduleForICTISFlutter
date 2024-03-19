import 'package:flutter/material.dart';

import '../../../domain/models/couple/couple.dart';
import '../../widgets/couples_item.dart';

class DaySchedule extends StatefulWidget {
  const DaySchedule({
    super.key,
    required this.pageNum
  });

  final int pageNum;

  @override
  State<StatefulWidget> createState() => _DaySchedule();
}

class _DaySchedule extends State<DaySchedule> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      children: [
        CouplesItem(
            couple: Couple(
                timeStart: const TimeOfDay(hour: 23, minute: 0),
                timeEnd: const TimeOfDay(hour: 9, minute: 35),
                audience: "Д-212",
                type: CoupleType.practice,
                discipline: "Управление проектами разработки программного обеспечения",
                lecturer: "Скороход С. В."
            )
        ),
        CouplesItem(
            couple: Couple(
                timeStart: const TimeOfDay(hour: 8, minute: 0),
                timeEnd: const TimeOfDay(hour: 9, minute: 35),
                audience: "LMS",
                type: CoupleType.lecture,
                discipline: "Управление проектами разработки программного обеспечения",
                lecturer: "Скороход С. В."
            )
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}