import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';
import 'package:collection/collection.dart';

import 'package:objectbox/objectbox.dart';
import 'couple_db.dart';

@Entity()
class DayScheduleDB {
  @Id() int id = 0;
  @Backlink('daySchedule')
  final couples = ToMany<CoupleDB>();
  final weekSchedule = ToOne<WeekScheduleDB>();

  bool get isVPK {
    final coupleDB = couples.firstWhereOrNull((element) => element.isVPKPlaceHolder);
    return coupleDB != null;
  }

  DayScheduleDB();

  factory DayScheduleDB.fromJson(List<dynamic> json) {
    final daySchedule = DayScheduleDB();

    List<CoupleDB> couplesDB = [];
    for (int coupleNum = 1; coupleNum < json.length; coupleNum++) {
      couplesDB.add(CoupleDB.fromString(json[coupleNum], coupleNum: coupleNum));
    }

    daySchedule.couples.addAll(couplesDB);

    return daySchedule;
  }
}