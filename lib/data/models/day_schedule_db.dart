import 'package:intl/intl.dart';
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

  @Index() @Unique(onConflict: ConflictStrategy.replace) String idForSearch;

  @Property(type: PropertyType.date)
  final DateTime date;

  bool get isVPK {
    final coupleDB = couples.firstWhereOrNull((element) => element.isVPKPlaceHolder);
    return coupleDB != null;
  }

  bool get isVUC {
    final coupleDB = couples.firstWhereOrNull((element) => element.isVUC);
    return coupleDB != null;
  }

  DayScheduleDB({required this.date, required this.idForSearch});

  factory DayScheduleDB.fromJson(List<dynamic> json, String id) {
    String dateStr = json[0];
    dateStr = dateStr.substring(0, 2) + dateStr.substring(3);
    final date = DateFormat("EEEE, d MMMM", "ru_RU").parseLoose(dateStr);

    final daySchedule = DayScheduleDB(date: date, idForSearch: id);

    List<CoupleDB> couplesDB = [];
    for (int coupleNum = 1; coupleNum < json.length; coupleNum++) {
      couplesDB.add(CoupleDB.fromString(json[coupleNum], coupleNum: coupleNum, idOfDay: id));
    }

    daySchedule.couples.addAll(couplesDB);

    return daySchedule;
  }
}