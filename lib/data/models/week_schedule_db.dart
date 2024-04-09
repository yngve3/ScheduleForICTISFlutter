import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:collection/collection.dart';

import '../../domain/models/schedule_subject/schedule_subject.dart';
import 'package:objectbox/objectbox.dart';
import '../../domain/models/week_number.dart';
import 'day_schedule_db.dart';

@Entity()
class WeekScheduleDB {
  @Id() int id =  0;
  @Index() @Unique(onConflict: ConflictStrategy.replace) String weekNumPlusSubjectID;
  final int calendarWeekNumber;
  final int studyWeekNumber;
  final scheduleSubject = ToOne<ScheduleSubject>();

  @Backlink('weekSchedule')
  final daySchedules = ToMany<DayScheduleDB>();

  bool get isVPK {
    final dayScheduleDB = daySchedules.firstWhereOrNull((element) => element.isVPK);
    return dayScheduleDB != null;
  }

  WeekScheduleDB({
    required this.weekNumPlusSubjectID,
    required this.calendarWeekNumber,
    required this.studyWeekNumber
  });

  factory WeekScheduleDB.empty(WeekNumber weekNumber) {
    return WeekScheduleDB(
      weekNumPlusSubjectID: "",
      calendarWeekNumber: weekNumber.calendarWeekNumber,
      studyWeekNumber: weekNumber.studyWeekNumber!,
    );
  }

  factory WeekScheduleDB.fromJson(
      Map<String, dynamic> json,
      ScheduleSubject scheduleSubject,
      WeekNumber? weekNumber
      ) {
    json = json['table'];
    final studyWeekNumber = weekNumber?.studyWeekNumber ?? json["week"];
    final id = IdGenerator.create(scheduleSubject.id, studyWeekNumber);

    final weekSchedule = WeekScheduleDB(
      weekNumPlusSubjectID: id,
      studyWeekNumber: weekNumber?.studyWeekNumber ?? json["week"],
      calendarWeekNumber: weekNumber?.calendarWeekNumber ?? DateTime.now().weekNumber
    );

    final List<dynamic> table = json['table'];

    int i = 3;
    weekSchedule.daySchedules.addAll(
        table.skip(2).map((e) => DayScheduleDB.fromJson(e, IdGenerator.createByIdAndNum(id, i++))).toList()
    );

    weekNumber = weekNumber ?? WeekNumber(
            studyWeekNumber: json["week"],
            calendarWeekNumber: DateTime.now().weekNumber
        );

    weekSchedule.scheduleSubject.target = scheduleSubject;

    return weekSchedule;
  }
}

class IdGenerator {
  static String create(String subjectID, int weekNum) {
    subjectID = subjectID
        .replaceAll(".html", "")
        .replaceFirst("m", "");

    return "$subjectID:$weekNum";
  }

  static String createByIdAndNum(String id, int num) {
    return "$id:$num";
  }

  static (String, int) parse(String id) {
    final idSplit = id.split(":");

    return (idSplit[0], int.parse(idSplit[1]));
  }
}