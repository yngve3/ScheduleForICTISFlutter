import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';

import 'package:objectbox/objectbox.dart';
import 'couple_db.dart';

@Entity()
class DayScheduleDB {
  @Id() int id = 0;
  @Backlink('daySchedule')
  final couples = ToMany<CoupleDB>();
  final weekSchedule = ToOne<WeekScheduleDB>();

  DayScheduleDB();

  factory DayScheduleDB.fromJson(List<dynamic> json) {
    final daySchedule = DayScheduleDB();
    daySchedule.couples.addAll(
        json.skip(1).map((e) => CoupleDB.fromString(e)).toList()
    );

    return daySchedule;
  }
}