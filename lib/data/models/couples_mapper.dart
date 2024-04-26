import 'package:collection/collection.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';

import 'couple_db.dart';

class CouplesMapper {
  static List<CoupleDB> fromJSON(Map<String, dynamic> json, {
    required WeekNumber? weekNumber,
    required ScheduleSubject scheduleSubject
  }) {
    json = json['table'];
    int studyWeekNum = json["week"];
    weekNumber = _createWeekNumberIfNull(weekNumber, studyWeekNum);

    final List<dynamic> weekSchedule = json["table"];

    List<CoupleDB> couplesDB = [];

    weekSchedule.skip(2).forEachIndexed((weekday, daySchedule) {
      (daySchedule as List<dynamic>).skip(1).forEachIndexed((coupleNum, coupleStr) {
        String id = _createID(
          studyWeekNum: studyWeekNum,
          scheduleSubjectID: scheduleSubject.id,
          coupleNum: coupleNum + 1,
          weekday: weekday + 1
        );

        final coupleDB = CoupleDB.fromString(coupleStr,
          coupleNum: coupleNum + 1,
          id: id,
          scheduleSubject: scheduleSubject,
          weekday: weekday + 1,
          weekNumber: weekNumber!
        );

        couplesDB.add(coupleDB);
      });
    });

    return couplesDB;
  }

  static WeekNumber _createWeekNumberIfNull(WeekNumber? weekNumber, int studyWeekNum) {
    if (weekNumber == null) {
      final date = DateTime.now();
      weekNumber = WeekNumber(
        calendarWeekNumber: date.weekNumber,
        weekStartDate: date.subtract(Duration(days: date.weekday - 1)),
        studyWeekNumber: studyWeekNum,
      );
    }

    return weekNumber;
  }

  static String _createID({
    required int studyWeekNum,
    required String scheduleSubjectID,
    required int coupleNum,
    required int weekday
  }) {
    scheduleSubjectID = scheduleSubjectID
        .replaceAll(".html", "")
        .replaceFirst("m", "");

    return "$scheduleSubjectID-$studyWeekNum-$weekday-$coupleNum";
  }
}