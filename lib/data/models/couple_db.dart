import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';

import '../../domain/models/schedule_subject/schedule_subject.dart';
import '../../objectbox.g.dart';
import '../../domain/models/couple/couple_type.dart';

@Entity()
class CoupleDB {
  @Id() int dbID = 0;
  @Index() @Unique(onConflict: ConflictStrategy.replace) final String id;

  final weekNumber = ToOne<WeekNumber>();
  final scheduleSubject = ToOne<ScheduleSubject>();

  final String audiences;
  final String discipline;
  final String lecturers;

  @Property(type: PropertyType.date)
  final DateTime dateTimeEnd;

  final String timeStart;
  final String timeEnd;

  @Transient() CoupleType? type;

  bool get isOnline => audiences.contains("LMS");
  bool get isVUC => discipline.contains("ВУЦ");

  bool get isNotVPKPlaceHolder => !discipline.contains("ВПК");
  bool get isVPKPlaceHolder => discipline.contains("ВПК");

  bool get isEmpty => discipline.isEmpty;
  bool get isNotEmpty => discipline.isNotEmpty;

  CoupleDB({
    required this.id,
    required this.audiences,
    required this.discipline,
    required this.lecturers,
    required this.dateTimeEnd,
    required this.timeStart,
    required this.timeEnd
  });

  static CoupleDB fromString(String coupleStr, {
    required int coupleNum,
    required String id,
    required ScheduleSubject scheduleSubject,
    required WeekNumber weekNumber,
    required weekday
  }) {
    String input = coupleStr;
    final typeRegExp = RegExp(r"пр\.|лаб\.|лек\.|экз\.");
    final type = typeRegExp.firstMatch(input)?[0] ?? "";
    input = input.replaceFirst(typeRegExp, "");

    String audiences = "";
    String lecturers = "";
    String groups = "";

    (audiences, input) = _applyRegExp(RegExp(r"LMS(-[0-9]| |$)|[А-Я]-[0-9]{3}[а-я]?"), input);
    (lecturers, input) = _applyRegExp(RegExp(r"(\d\d? п/г)? [А-Я][а-я]* [А-Я]. [A-Я]."), input);
    (groups, input) = _applyRegExp(RegExp(
        r"КТ[бмас][озв]\d-\d\d?,?"
        r"|ВПК \d\d?-\d\d?(.\d)?,?"
        r"|\d{2}[А-ЯЁа-яё]{2}-\d{2}\.\d{2}\.\d{2}\.\d{2}-[а-о]\d,?"
        r"|Группа\d"
    ), input);

    final timeStart = TimeOfDayExtension.timeStart(coupleNum) ?? TimeOfDay.now();
    final timeEnd = TimeOfDayExtension.timeEnd(coupleNum) ?? TimeOfDay.now();
    final date = weekNumber.weekStartDate.add(Duration(days: weekday - 1));

    final CoupleDB coupleDB = CoupleDB(
      id: id,
      audiences: audiences,
      discipline: input,
      lecturers: lecturers.isNotEmpty ? lecturers : groups,
      timeStart: timeStart.string,
      timeEnd: timeEnd.string,
      dateTimeEnd: DateTime(date.year, date.month, date.day, timeEnd.hour, timeEnd.minute)
    );

    coupleDB.type = CoupleType.fromString(type);
    coupleDB.scheduleSubject.target = scheduleSubject;
    coupleDB.weekNumber.target = weekNumber;

    return coupleDB;
  }

  static (String, String) _applyRegExp(RegExp regExp, String source) {
    final matches = regExp.allMatches(source).map((e) => e.group(0)).join(", ").trim();
    source = source.replaceAll(regExp, "");
    return (source, matches);
  }

  String? get dbType {
    return type?.name;
  }

  set dbType(String? value) {
    if (value == null) {
      type = null;
    } else {
      for (CoupleType type in CoupleType.values) {
        if (type.name == value) {
          this.type = type;
        }
      }
    }
  }
}